
#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

#include "slamBase.h"

#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/passthrough.h>

#include <g2o/types/slam3d/types_slam3d.h>
#include <g2o/core/sparse_optimizer.h>
#include <g2o/core/block_solver.h>
#include <g2o/core/factory.h>
#include <g2o/core/optimization_algorithm_factory.h>
#include <g2o/core/optimization_algorithm_gauss_newton.h>
#include <g2o/solvers/csparse/linear_solver_csparse.h>
#include <g2o/core/robust_kernel.h>
#include <g2o/core/robust_kernel_factory.h>
#include <g2o/core/optimization_algorithm_levenberg.h>


typedef g2o::BlockSolver_6_3 SlamBlockSolver;
typedef g2o::LinearSolverCSparse< SlamBlockSolver::PoseMatrixType > SlamLinearSolver;

FRAME readFrame( int index, ParameterReader& pd );

double normofTransform( cv::Mat rvec, cv::Mat tvec );


enum CHECK_RESULT {NOT_MATCHED=0, TOO_FAR_AWAY, TOO_CLOSE, KEYFRAME};

CHECK_RESULT checkKeyframes( FRAME& f1, FRAME& f2, g2o::SparseOptimizer& opti, bool is_loops=false );

void checkNearbyLoops( vector<FRAME>& frames, FRAME& currFrame, g2o::SparseOptimizer& opti );

void checkRandomLoops( vector<FRAME>& frames, FRAME& currFrame, g2o::SparseOptimizer& opti );


int main( int argc, char** argv )
{
   
    ParameterReader pd;
    int startIndex  =   atoi( pd.getData( "start_index" ).c_str() );
    int endIndex    =   atoi( pd.getData( "end_index"   ).c_str() );
cout<<startIndex<<endl;
cout<<endIndex<<endl;
    
    vector< FRAME > keyframes;
    // initialize
    cout<<"Initializing ..."<<endl;
 int currIndex = startIndex; 
    FRAME currFrame;
   double t=(double)cvGetTickCount();
    while(currFrame.rgb.rows==0||currFrame.depth.rows==0)
{
    currFrame = readFrame( currIndex, pd ); 
     cout<<"rows"<<currFrame.rgb.rows<<endl;

}
cout<<"break"<<endl;

    string detector = pd.getData( "detector" );
    string descriptor = pd.getData( "descriptor" );
    CAMERA_INTRINSIC_PARAMETERS camera = getDefaultCamera();
    computeKeyPointsAndDesp( currFrame, detector, descriptor );
    PointCloud::Ptr cloud = image2PointCloud( currFrame.rgb, currFrame.depth, camera );

    
    SlamLinearSolver* linearSolver = new SlamLinearSolver();
    linearSolver->setBlockOrdering( false );
    SlamBlockSolver* blockSolver = new SlamBlockSolver( linearSolver );
    g2o::OptimizationAlgorithmLevenberg* solver = new g2o::OptimizationAlgorithmLevenberg( blockSolver );

    g2o::SparseOptimizer globalOptimizer;  
    globalOptimizer.setAlgorithm( solver );
   
    globalOptimizer.setVerbose( false );


  
    g2o::VertexSE3* v = new g2o::VertexSE3();
    v->setId( currIndex );
    v->setEstimate( Eigen::Isometry3d::Identity() );
    v->setFixed( true ); 
    globalOptimizer.addVertex( v );

    keyframes.push_back( currFrame );

    double keyframe_threshold = atof( pd.getData("keyframe_threshold").c_str() );

    bool check_loop_closure = pd.getData("check_loop_closure")==string("yes");
  for ( currIndex=startIndex+1; currIndex<endIndex; currIndex++ )
    {
        cout<<"Reading files "<<currIndex<<endl;
        FRAME currFrame = readFrame( currIndex,pd ); // 读�~O~VcurrFrame
        if(currFrame.rgb.rows==0||currFrame.depth.rows==0)
        {
           currIndex=currIndex-1;
           cout<<currIndex<<endl;
           continue;

          }

        computeKeyPointsAndDesp( currFrame, detector, descriptor ); 
        CHECK_RESULT result = checkKeyframes( keyframes.back(), currFrame, globalOptimizer ); 
        switch(result)
        {
        case NOT_MATCHED:
           
            cout<<RED"Not enough inliers."<<endl;
            break;
        case TOO_FAR_AWAY:
            
            cout<<RED"Too far away, may be an error."<<endl;
            break;
        case TOO_CLOSE:
           
            cout<<RESET"Too close, not a keyframe"<<endl;
            break;
        case KEYFRAME:
            cout<<GREEN"This is a new keyframe"<<endl;
       
            /**
             * This is important!!
             * This is important!!
             * This is important!!
             * (very important so I've said three times!)
             */
    
            if (check_loop_closure)
            {
                checkNearbyLoops( keyframes, currFrame, globalOptimizer );
                checkRandomLoops( keyframes, currFrame, globalOptimizer );
            }
            keyframes.push_back( currFrame );
            break;
        default:
            break;
        }
  }

    // ��~X�~L~V
    cout<<RESET"optimizing pose graph, vertices: "<<globalOptimizer.vertices().size()<<endl;
    globalOptimizer.save("../data/result_before.g2o");
    globalOptimizer.initializeOptimization();
    globalOptimizer.optimize( 100 ); //�~O�以�~L~G��~Z��~X�~L~V步�~U�
    globalOptimizer.save( "../data/result_after.g2o" );
    cout<<"Optimization done."<<endl;
   t = (double)cvGetTickCount() - t;
    cout<<"runtime:"<<t/(cvGetTickFrequency()*1000000)<<endl;



    // �~K��~N��~B���~Q�~\��~[�
    cout<<"saving the point cloud map..."<<endl;
    PointCloud::Ptr output ( new PointCloud() ); //�~E���~@�~\��~[�
    PointCloud::Ptr tmp ( new PointCloud() );

    pcl::VoxelGrid<PointT> voxel; // ��~Q�| �滤波�~Y���~L��~C�~U��~\��~[��~H~F辨�~N~G
    pcl::PassThrough<PointT> pass; // z�~V����~Z~D�~\~I�~U~H深度�~L��~W��~\~I�~Y�~Z~D�~N��~N~I
    pass.setFilterFieldName("z");
    pass.setFilterLimits( 0.0, 4.0 ); //4m以��~J就��~M��~A��~F

    double gridsize = atof( pd.getData( "voxel_grid" ).c_str() ); //�~H~F辨�~[��~O�以�~\�parameters.txt�~G~L��~C
    voxel.setLeafSize( gridsize, gridsize, gridsize );

    for (size_t i=0; i<keyframes.size(); i++)
    {
        // ��~Ng2o�~G~L�~O~V�~G���~@帧
        g2o::VertexSE3* vertex = dynamic_cast<g2o::VertexSE3*>(globalOptimizer.vertex( keyframes[i].frameID ));
        Eigen::Isometry3d pose = vertex->estimate(); //该帧��~X�~L~V�~P~N�~Z~D��~M姿
        PointCloud::Ptr newCloud = image2PointCloud( keyframes[i].rgb, keyframes[i].depth, camera ); //转�~H~P�~B���~Q
        // 以��~K�~X�滤波
        voxel.setInputCloud( newCloud );
        voxel.filter( *tmp );
        pass.setInputCloud( tmp );
        pass.filter( *newCloud );
        // �~J~J�~B���~Q�~O~X�~M����~[�中
        Eigen::Matrix4f transform;
        for(int i=0;i<4;i++)
           for(int j=0;j<4;j++)
           {
           transform(i,j)=pose(i,j);

            }

        pcl::transformPointCloud( *newCloud, *tmp, transform );
        *output += *tmp;
        tmp->clear();
        newCloud->clear();
    }
 voxel.setInputCloud( output );
    voxel.filter( *tmp );
    //��~X�~B�

    pcl::io::savePCDFile( "../data/result.pcd", *tmp );

    cout<<"Final map is saved."<<endl;
    globalOptimizer.clear();

    return 0;
}



FRAME readFrame( int index, ParameterReader& pd )
{
    FRAME f;
    string rgbDir   =   pd.getData("rgb_dir");
    string depthDir =   pd.getData("depth_dir");

    string rgbExt   =   pd.getData("rgb_extension");
    string depthExt =   pd.getData("depth_extension");

    stringstream ss;
    ss<<rgbDir<<index<<rgbExt;
    string filename;
    ss>>filename;
    f.rgb = cv::imread( filename );

    ss.clear();
    filename.clear();
    ss<<depthDir<<index<<depthExt;
    ss>>filename;

    f.depth = cv::imread( filename, -1 );
    f.frameID = index;
    return f;
}

double normofTransform( cv::Mat rvec, cv::Mat tvec )
{
    return fabs(min(cv::norm(rvec), 2*M_PI-cv::norm(rvec)))+ fabs(cv::norm(tvec));
}

CHECK_RESULT checkKeyframes( FRAME& f1, FRAME& f2, g2o::SparseOptimizer& opti, bool is_loops)
{
    static ParameterReader pd;
    static int min_inliers = atoi( pd.getData("min_inliers").c_str() );
    static double max_norm = atof( pd.getData("max_norm").c_str() );
    static double keyframe_threshold = atof( pd.getData("keyframe_threshold").c_str() );
    static double max_norm_lp = atof( pd.getData("max_norm_lp").c_str() );
    static CAMERA_INTRINSIC_PARAMETERS camera = getDefaultCamera();
    static g2o::RobustKernel* robustKernel = g2o::RobustKernelFactory::instance()->construct( "Cauchy" );
    // ��~T��~Cf1 �~R~L f2
    RESULT_OF_PNP result = estimateMotion( f1, f2, camera );
    if ( result.inliers < min_inliers ) //inliers��~M��~_��~L�~T���~C该帧
        return NOT_MATCHED;
    // 计��~W��~P�~J��~L~C�~[��~X��~P�太大
    double norm = normofTransform(result.rvec, result.tvec);
    if ( is_loops == false )
    {
        if ( norm >= max_norm )
            return TOO_FAR_AWAY;   // too far away, may be error
    }
    else
    {
        if ( norm >= max_norm_lp)
            return TOO_FAR_AWAY;
    }

    if ( norm <= keyframe_threshold )
        return TOO_CLOSE;   // too adjacent frame


 // �~P~Qg2o中��~^�~J| ��~Y个顶�~B���~N��~J��~@帧�~A~T系�~Z~D边
    // 顶�~B��~C��~H~F
    // 顶�~B��~O��~\~@设��~Zid�~M��~O�
    if (is_loops == false)
    {
        g2o::VertexSE3 *v = new g2o::VertexSE3();
        v->setId( f2.frameID );
        v->setEstimate( Eigen::Isometry3d::Identity() );
        opti.addVertex(v);
    }
    // 边�~C��~H~F
    g2o::EdgeSE3* edge = new g2o::EdgeSE3();
    // ��~^�~N�此边�~Z~D两个顶�~B�id
    edge->vertices() [0] = opti.vertex( f1.frameID );
    edge->vertices() [1] = opti.vertex( f2.frameID );
    edge->setRobustKernel( robustKernel );
    // 信�~A��~_��~X�
    Eigen::Matrix<double, 6, 6> information = Eigen::Matrix< double, 6,6 >::Identity();
    
    information(0,0) = information(1,1) = information(2,2) = 100;
    information(3,3) = information(4,4) = information(5,5) = 100;
  
    edge->setInformation( information );
   
    Eigen::Isometry3d T = cvMat2Eigen( result.rvec, result.tvec );
    edge->setMeasurement( T.inverse() );
    // ��~F此边�~J| �~E��~[�中

    opti.addEdge(edge);
    cout<<"edge entered"<<endl;

    return KEYFRAME;

}
void checkNearbyLoops( vector<FRAME>& frames, FRAME& currFrame, g2o::SparseOptimizer& opti )
{
    static ParameterReader pd;
    static int nearby_loops = atoi( pd.getData("nearby_loops").c_str() );

    // 就�~X��~J~JcurrFrame�~R~L frames�~G~L�~\�尾�~G| 个��~K��~@�~A~M
    if ( frames.size() <= nearby_loops )
    {
        // no enough keyframes, check everyone
        for (size_t i=0; i<frames.size(); i++)
        {
            checkKeyframes( frames[i], currFrame, opti, true );
        }
    }
    else
    {
        // check the nearest ones
        for (size_t i = frames.size()-nearby_loops; i<frames.size(); i++)
        {
            checkKeyframes( frames[i], currFrame, opti, true );
        }
    }
}

void checkRandomLoops( vector<FRAME>& frames, FRAME& currFrame, g2o::SparseOptimizer& opti )
{
    static ParameterReader pd;
    static int random_loops = atoi( pd.getData("random_loops").c_str() );
    srand( (unsigned int) time(NULL) );
    // �~Z~O�~\��~O~V��~@��~[帧��~[��~L��~@��~K

    if ( frames.size() <= random_loops )
    {
        // no enough keyframes, check everyone
        for (size_t i=0; i<frames.size(); i++)
        {
            checkKeyframes( frames[i], currFrame, opti, true );

        }
    }
    else
    {
        // randomly check loops
        for (int i=0; i<random_loops; i++)
        {
            int index = rand()%frames.size();
            checkKeyframes( frames[index], currFrame, opti, true );
        }
    }
}
















