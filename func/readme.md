说明
1、程序名：readexcel2m.m 
	原数据文件为excel文件格式，为便于在matlab处理，将已结束项目任务数据写入m1.mat,会员信息数据写入m2.mat,新项目任务数据写入m3.mat，
	m1中已结束完成任务号码记入变量'compl_Mission_ID'，已结束任务gps纬度lat,经度lon记入变量'compl_Mission_lat_lon',已结束任务标价记入变量'compl_Mission_price',
	已结束任务执行情况记入变量'compl_Mission',
	m2中会员编号记入变量'full_member_ID'，会员位置(GPS)纬度lat,经度lon记入变量'full_member_Lat_Lon',会员预订任务限额记入变量'full_member_Mission_Limit',
	预订任务开始时间记入变量'full_member_Mission_Begin_Time',会员信誉值记入变量'full_member_Credit',
	m3中新任务号码记入变量'new_Mission_ID'，新任务gps纬度lat,经度lon记入变量'new_Mission_Lat_Lon'。
2、程序名：Member_Dirtribution_Mission
	按会员分配比例确定每个会员可选的任务数，按任务选择时间由会员依次选择任务，直至任务全部选择完毕，确定实际选到任务的会员集合。
	有效会员情况记入m2.mat文件的变量'member_ID'，'member_Lat_Lon','member_Mission_Limit'（会员实际选择任务数）,'member_Mission_Begin_Time','member_Credit'。后续
	计算皆以此数据进行。
3、程序名：cul_distance.m
	以每个任务为起始点，计算距各任务点的距离，组成mission_Distance距离矩阵；
	以每个任务为起始点，计算距各会员的距离，组成mission_Member_Distance距离矩阵；记入distance_value.mat文件。
4、程序名：Merber_K_means_clustering.m
	以指定的K值对会员的地理位置进行聚类分群，计算各会员到其所属群中心的距离，记入变量'kernel_member_Distance',
	会员所属群记入'idx_member',各群中心纬度、经度记入变量'ctrs_member'；记入kernel_member_distance文件。
5、程序名：Mission_K_means_clustering.m
	以指定的K值对任务的地理位置进行聚类分群，计算各任务点到其所属群中心的距离，记入变量'kernel_mission_Distance',
	任务点所属群记入'idx_mission',各群中心纬度、经度记入变量'ctrs_mission'；记入'kernel_missio_distance'文件。注意聚类操作每次结果都有不同。
6、程序名：ansysData_prepare.m 对价格和任务完成情况可能相关的因素进行统计
	统计每个任务点最近的memCount_limit个会员的情况，预计分配任务总数'anyCount_Member_MisSum',会员平均距离'anyCount_Member_DisMean','anyCount_Member_DisStd',
	会员平均信誉值'anyCount_Member_CreMean','anyCount_Member_CreStd'，并记入'anyCount_MemData'文件	
	统计每个任务点最近的misCount_limit个任务的情况，任务平均距离'anyCount_Mission_DisMean','anyCount_Mission_DisStd',任务平均价格'anyCount_Mission_PriMean','anyCount_Mission_PriStd'，
	并记入'anyCount_MisData'文件
	计算每个任务点为中心，misDis_limit公里为半径的圆周范围内会员、任务情况，
	会员总数'anyDis_Member_Count',	会员平均距离'anyDis_Member_DisMean','anyDis_Member_DisStd',	会员平均信誉值'anyDis_Member_CreMean','anyDis_Member_CreStd',	会员预分配任务总数'anyDis_Member_MisSum',		
	任务总数'anyDis_Mission_Count',	任务平均距离'anyDis_Mission_DisMean','anyDis_Mission_DisStd',任务平均价格'anyDis_Mission_PriMean','anyDis_Mission_PriStd
	并记入'anyDis_MemData'文件
7、程序名：ansysData_Stand.m 
	依据上述程序统计结果，进行各因素数据的标准化
	stCompl_Mission_Price			任务价格					
	stCount_Member_MisSum			定会员数的任务总数
	stCount_Member_DisMean			定会员数的会员平均距离			stCount_Member_DisStd
	stCount_Member_CreMean      	定会员数的平均信誉值 2			stCount_Member_CreStd
	stCount_Mission_DisMean     	定任务数的任务平均距离			stCount_Mission_DisStd 
	stCount_Mission_PriMean     	定任务数的任务平均价格			stCount_Mission_PriStd
	stDis_Member_Count          	定距离的会员总数 3			
	stDis_Member_CreMean        	定距离的平均会员信誉值 4		stDis_Member_CreStd
	stDis_Member_DisMean        	定距离的会员平均距离			stDis_Member_DisStd
	stDis_Member_MisSum         	定距离的会员所拥有的任务总数
	stDis_Mission_Count         	定距离的任务总数
	stDis_Mission_PriMean       	定距离的任务平均价格			stDis_Mission_PriStd  
	stDis_Mission_DisMean       	定距离的任务平均距离			stDis_Mission_DisStd 
	stKer_Mission_Distance 			任务聚类中心距任务距离
	stMemberKer_Mission_Distance	会员中心与各任务的最小距离
	stKer_Member_Distance 			会员到其会员中心的距离
8、程序名：ansys_price.m  分析定价规律程序
	本题m1项目的任务定价规律，灰箱、黑箱分析方法不能说明规律，因此只能采取主因分析法。
	价格是明确的，这是目标明确的模型，	线性回归和非线性回归是最先考虑的方案。
	首先要进行相关分析，去除相关性差的因素。由于数据因素中有缺失数据(NaN),先选取无NaN因素分析。
	分析result_relat，可以得出：
	对相对价格，所有因素皆相关，但皆无强相关性。所以线性回归不适用。
	各因素之间，同名称的因素强相关性，不同名称的因素有弱相关性。
	因此，绘制价格-因素散点图，确定对价格分类有效的因素。观察得stCount_Member_CreMean(:,1),stCount_Member_CreStd(:,2),stDis_Member_CreMean(:,2),
	stDis_Member_Count(:,3),stDis_Member_MisSum(:,3),stDis_Mission_Count(:,3)为有效因素。对有效因素进行主因分析，可得主因3个，方差和占全部方差的92.3%。
	作三个主因与价格散点图，可见三个主因坐标下低于65的价格的任务与其它任务有区别（任务密、信誉高的任务价格一定低于70）；其它价格在三个主因下没有呈现特别的聚类特征；
	因此，任务本身的价值影响不能忽略。
	观察价格频数图，可以看出所有价格相对集中分布于60-70，70-72，72-75，80，85共5个区域。可以理解为任务本身价值的影响。
	对上述区间价格频数分布进行检验，未发现符合明确的分布类型且各个集合之间分布有显著不同，应理解为自然需求形成的杂散分布。
	参考按价格分类的因素_频数图可知，任务点为中心5Km范围内的所有有效会员的总信誉值的标准化值大于0.15，其任务价格小于70的概率92.5%。
	综上所述，本课题的定价原则是按任务需求的价值确定基本价格，再按任务点为中心5Km范围内的所有有效会员的总信誉值的标准化值0.15为限，大于的一般调整为65-70。
9、程序名：ansys_mission.m  分析任务完成规律程序

	

