#include "slamBase.h"

PointCloud::Ptr image2PointCloud( cv::Mat& rgb, cv::Mat& depth, CAMERA_INTRINSIC_PARAMETERS& camera )
{
    PointCloud::Ptr cloud ( new PointCloud );

    for (int m = 0; m < depth.rows; m++)
        for (int n=0; n < depth.cols; n++)
        {
            // �~N��~O~V深度�~[�中(m,n)��~D�~Z~D�~@�
            ushort d = depth.ptr<ushort>(m)[n];
            // d �~O��~C�没�~\~I�~@���~L�~K���~B此��~L跳��~G此�~B�
            if (d == 0)
                continue;
            // d ��~X�~\��~@���~L�~H~Y�~P~Q�~B���~Q��~^�~J| ��~@个�~B�
            PointT p;

            // 计��~W��~Y个�~B��~Z~D空�~W��~]~P�| ~G
            p.z = double(d) / camera.scale;
            p.x = (n - camera.cx) * p.z / camera.fx;
            p.y = (m - camera.cy) * p.z / camera.fy;

            // ��~Nrgb�~[��~C~O中�~N��~O~V��~C�~Z~D��~\�~I�
            // rgb�~X���~I�~@~Z�~A~S�~Z~DBGR�| ���~O�~[���~L�~I~@以�~L~I��~K�~]��~Z~D顺��~O�~N��~O~V��~\�~I�
            p.b = rgb.ptr<uchar>(m)[n*3];
            p.g = rgb.ptr<uchar>(m)[n*3+1];
            p.r = rgb.ptr<uchar>(m)[n*3+2];

            // �~J~Jp�~J| �~E��~H��~B���~Q中
            cloud->points.push_back( p );
        }
    // 设置并��~]��~X�~B���~Q
    cloud->height = 1;
    cloud->width = cloud->points.size();
    cloud->is_dense = false;

    return cloud;
}

cv::Point3f point2dTo3d( cv::Point3f& point, CAMERA_INTRINSIC_PARAMETERS& camera )
{
    cv::Point3f p; // 3D �~B�
    p.z = double( point.z ) / camera.scale;
    p.x = ( point.x - camera.cx) * p.z / camera.fx;
    p.y = ( point.y - camera.cy) * p.z / camera.fy;
    return p;
}
void computeKeyPointsAndDesp( FRAME& frame, string detector, string descriptor )
{
    cv::Ptr<cv::FeatureDetector> _detector;
    cv::Ptr<cv::DescriptorExtractor> _descriptor;

    cv::initModule_nonfree();
    _detector = cv::FeatureDetector::create( detector.c_str() );
    _descriptor = cv::DescriptorExtractor::create( descriptor.c_str() );

    if (!_detector || !_descriptor)
    {
        cerr<<"Unknown detector or discriptor type !"<<detector<<","<<descriptor<<endl;
        return;
    }

    _detector->detect( frame.rgb, frame.kp );
    _descriptor->compute( frame.rgb, frame.kp, frame.desp );

    return;
}

RESULT_OF_PNP estimateMotion( FRAME& frame1, FRAME& frame2, CAMERA_INTRINSIC_PARAMETERS& camera )
{
    static ParameterReader pd;
    vector< cv::DMatch > matches;
    cv::FlannBasedMatcher matcher;

   matcher.match( frame1.desp, frame2.desp, matches );
   // cout<<"sucess"<<endl;
    RESULT_OF_PNP result;
    vector< cv::DMatch > goodMatches;
    double minDis = 9999;
    double good_match_threshold = atof( pd.getData( "good_match_threshold" ).c_str() );
    for ( size_t i=0; i<matches.size(); i++ )
    {
        if ( matches[i].distance < minDis )
            minDis = matches[i].distance;
    }
    if(minDis<5)
        minDis=5;

    for ( size_t i=0; i<matches.size(); i++ )
    {
        if (matches[i].distance < good_match_threshold*minDis)
            goodMatches.push_back( matches[i] );
    }

    cout<<"good matches: "<<goodMatches.size()<<endl;

    if (goodMatches.size() <= 5)
    {
        result.inliers = -1;
        return result;
    }
    // 第��~@个帧�~Z~D��~I维�~B�
    vector<cv::Point3f> pts_obj;
    // 第��~L个帧�~Z~D�~[��~C~O�~B�
    vector< cv::Point2f > pts_img;
 // �~[��~\��~F~E�~O~B
    for (size_t i=0; i<goodMatches.size(); i++)
    {
        // query �~X�第��~@个, train �~X�第��~L个
        cv::Point2f p = frame1.kp[goodMatches[i].queryIdx].pt;
        // �~N��~O~Vd�~X���~A��~O��~C��~Ax�~X��~P~Q�~O��~Z~D��~Ly�~X��~P~Q��~K�~Z~D��~L�~I~@以y�~I~M�~X���~L��~Lx�~X��~H~W��~A
        ushort d = frame1.depth.ptr<ushort>( int(p.y) )[ int(p.x) ];
        if (d == 0)
            continue;
        pts_img.push_back( cv::Point2f( frame2.kp[goodMatches[i].trainIdx].pt ) );

        // ��~F(u,v,d)转�~H~P(x,y,z)
        cv::Point3f pt ( p.x, p.y, d );
        cv::Point3f pd = point2dTo3d( pt, camera );
        pts_obj.push_back( pd );
    }

    if (pts_obj.size() ==0 || pts_img.size()==0)
    {
        result.inliers = -1;
        return result;
    }

    double camera_matrix_data[3][3] = {
        {camera.fx, 0, camera.cx},
        {0, camera.fy, camera.cy},
        {0, 0, 1}
    };

    // �~^~D建�~[��~\��~_��~X�
    cv::Mat cameraMatrix( 3, 3, CV_64F, camera_matrix_data );
    cv::Mat rvec, tvec, inliers;

    // ��~B解pnp
    cv::solvePnPRansac( pts_obj, pts_img, cameraMatrix, cv::Mat(), rvec, tvec, false, 100, 1.0, 100, inliers );

    result.rvec = rvec;
    result.tvec = tvec;
    result.inliers = inliers.rows;

    return result;


}

// cvMat2Eigen
Eigen::Isometry3d cvMat2Eigen( cv::Mat& rvec, cv::Mat& tvec )
{
    cv::Mat R;
    cv::Rodrigues( rvec, R );
    Eigen::Matrix3d r;
    cv::cv2eigen(R, r);

    // ��~F平移�~P~Q�~G~O�~R~L�~W~K转�~_��~X�转�~M��~H~P�~O~X�~M��~_��~X�
    Eigen::Isometry3d T = Eigen::Isometry3d::Identity();

    Eigen::AngleAxisd angle(r);
    Eigen::Translation<double,3> trans(tvec.at<double>(0,0), tvec.at<double>(0,1), tvec.at<double>(0,2));
    T = angle;
    T(0,3) = tvec.at<double>(0,0);
    T(1,3) = tvec.at<double>(0,1);
    T(2,3) = tvec.at<double>(0,2);
    return T;
}

// joinPointCloud 
// ��~S�~E���~Z�~N~_��~K�~B���~Q��~L�~V��~]��~Z~D帧以�~O~J��~C�~Z~D��~M姿
// ��~S�~G���~Z��~F�~V��~]�帧�~J| �~H��~N~_��~K帧�~P~N�~Z~D�~[��~C~O
PointCloud::Ptr joinPointCloud( PointCloud::Ptr original, FRAME& newFrame, Eigen::Matrix4f transform, CAMERA_INTRINSIC_PARAMETERS& camera )
{
    PointCloud::Ptr newCloud = image2PointCloud( newFrame.rgb, newFrame.depth, camera );

    // �~P~H并�~B���~Q
    PointCloud::Ptr output (new PointCloud());
    pcl::transformPointCloud( *original, *output, transform );
    *newCloud += *output;

    // Voxel grid 滤波�~Y~M�~G~G�| �
    static pcl::VoxelGrid<PointT> voxel;
    static ParameterReader pd;
    double gridsize = atof( pd.getData("voxel_grid").c_str() );
    voxel.setLeafSize( gridsize, gridsize, gridsize );
    voxel.setInputCloud( newCloud );
    PointCloud::Ptr tmp( new PointCloud() );
    voxel.filter( *tmp );
    return tmp;
}
                                                                                                                                                                                           

