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
	统计每个任务点最近的misCount_limit个任务的情况，
	任务平均距离'anyCount_Mission_DisMean','anyCount_Mission_DisStd',任务平均价格'anyCount_Mission_PriMean','anyCount_Mission_PriStd'，
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
9、程序名：ansys_mission.m  分析影响任务完成因素程序
	a、层次分析法是主观分析法，评价确定的数据集规律时精度不足，不适用于分析任务未完成的原因。附程序levels.m 进行层次分析法数学计算。
		A 任务未完成原因
		B1位置			B2分配			B3价格
		C1任务位置		C2会员位置		C3会员信誉值		C4任务价格
		A=[1,1/5,3;5,1,5;1/3,1/5,1];	wA=[0.21,0.69,0.1]' 		CRA=0.1198>0.1 未通过一致性检验，说明A成对比较矩阵不一致，应重新进行评价建立
		原表中A31误为3
		B1=[1,1/3;3,1];C1,C2			wB1=[0.25,0.75]				比较矩阵B1系列较草率										
		原表中B121误为5
		B2=[1,1/5;5,1];C2,C3			wB2=[0.17,0.83]				比较矩阵B1系列较草率
		B3=[1,5;1/5,1];C1,C4			wB3=[0.83,0.17]				比较矩阵B1系列较草率
		选择矩阵C=[0.14,0.27,0.57,0.02]		此向量表明了各方案层数据集对未完成任务的影响。
		由于未明确方案C数据集，无法时行验算。
						
	b、logit(logistic)模型可用于对确定的数据进行拟合，可分析主要原因，并可进行预测。
		本课先进行所有因素的logit数学计算，由于距离小于45km范围内存在任务数或会员数为零的任务，其平均数、标准差可能是NaN，影响分析计算。
		所以将数据集划分所有因素不含NaN集合allNoNaN_Data(即5Km范围内含2个以上任务以及含2个以上人员的任务数据集合)，
		以及剩余的任务数据集合other_Data。
		allNoNaN_Data的任务数为530，75个因素组成的数据集进行logit拟合，结果预测正确率88.87%,拟合离差残卷和为317.6。
		经逐次消除法对stats.p大于0.02的因素进行消除，得到28个因素的数据集进行logit拟合，结果预测正确率86.22%，拟合离差残卷和为382.81。
		预测精度矩阵：
		|90.49%	9.51% |
		|20.59%	79.41%|
		可见，logit预测对完成的任务精度大于未完成的任务。
		对照logit因素、beta、p值：
			'stCount_Member_MisSum2'	-2.5	7.49e-06
			'stCount_Member_DisMean1'	-1.4	0.002
			'stCount_Member_DisMean3'	-2.2	2.256e-05
			'stCount_Member_DisStd1'	1.84	5.85e-10
			'stCount_Member_DisStd3'	1.00	0.00014
			'stCount_Member_CreMean1'	1.48	0.00164
			'stCount_Member_CreStd1'	-1.1	0.00081
			'stCount_Member_CreStd2'	2.39	1.80e-07
		2	'stCount_Mission_DisMean2'	3.12	0.00142
		-3	'stCount_Mission_DisMean3'	-2.5	0.01047
			'stCount_Mission_DisStd3'	1.00	0.01126
			'stCount_Mission_PriMean1'	-1.6	4.75e-10
			'stDis_Member_Count1'		1.38	0.00021
		-2	'stDis_Member_Count3'		-6.2	0.00200
			'stDis_Member_CreSum2'		1.48	6.12e-05
		-1	'stDis_Member_CreSum3'		-6.3	5.03e-10		
			'stDis_Member_CreMean1'		1.09	4.89e-07
			'stDis_Member_CreMean2'		-1.4	0.00046
			'stDis_Member_CreMean3'		1.00	4.78e-05
			'stDis_Member_DisMean1'		0.42	0.00347
			'stDis_Member_DisMean2'		-0.6	0.00092
			'stDis_Member_MisSum1'		-1.5	0.00088
			'stDis_Member_MisSum2'		-1.5	0.00041
		1	'stDis_Member_MisSum3'		8.17	0.00055			
		3	'stDis_Mission_PriSum3'		2.73	1.99e-06
			'stDis_Mission_PriStd1'		0.59	0.00190
			'stDis_Mission_DisMean2'	0.60	0.00261
			'stMemberKer_Mission_Distance'	-0.851085560033706	0.426951199131241	0.00123490756158342
		可知，对完成5km范围内有至少2人及2个任务的任务起正影响的因素中，最大的是50Km范围内会员任务总数，其次是5个任务平均距离、50Km范围内任务价格总数；
		对完成任务起反影响的因素中，最大的是50Km范围内会员信誉总和及会员人数，其次是10个任务平均距离；
		other_Data的任务数为305，59个因素组成的数据集进行logit拟合，结果预测正确率85.25%,拟合离差残卷和为175.75。
		经逐次消除法对stats.p大于0.02的因素进行消除，得到15个因素的数据集进行logit拟合，结果预测正确率82.62%，拟合离差残卷和为231.32。
		预测精度矩阵：
		|89.29%	10.71% |
		|29.36%	70.64%|
		可见，logit预测对完成的任务精度大于未完成的任务。
		对照logit因素、beta、p值：
			'stCount_Member_DisMean2'		2.52782358082960	8.40917042785869e-05
			'stCount_Member_DisMean3'		-3.95782131522661	1.48616699380691e-06
			'stCount_Member_DisStd3'		1.75198457689167	7.45610850515420e-05
			'stCount_Member_CreMean2'		1.79354487129450	9.39953999670359e-07
			'stCount_Mission_DisMean1'		-1.17106621098683	0.00108482955707625
			'stCount_Mission_PriMean1'		-0.767039040113786	0.00295439325572899
		-2	'stDis_Member_Count3'			-15.4501269529551	1.10518172946705e-06
		-3	'stDis_Member_CreSum3'			-6.57692629277450	4.21399323366181e-09
			'stDis_Member_DisMean3'			-0.836702175009827	0.0123764546228476
		2	'stDis_Member_MisSum3'			17.5371346526908	1.28955674281533e-06
			'stDis_Mission_Count2'			-6.38501185928416	9.19974323343829e-06
		1	'stDis_Mission_Count3'			144.242624903012	1.79540704422476e-07
		-1	'stDis_Mission_PriSum3'			-143.940793364395	1.68314584743061e-07
		3	'stDis_Mission_DisSum2'			4.64998848294700	0.000180498723168740
			'stDis_Mission_DisMean3'		-1.49021686098641	0.000566834398416310
		可知，对完成5km范围内有没有2人或2个任务的任务起正影响的因素中，最大的是50Km范围内任务总数、会员任务总数，其次是5km任务距离总和；
		对完成5km范围内有没有2人或2个任务的任务起反影响的因素中，最大的是50Km范围内任务价格总数,其次是50Km范围内会员人数，最后是50Km范围内会员信誉总和；
		综合上述，可知；
		对5km范围内有没有2人或2个任务的任务，50Km范围内任务总数越大任务完成越好、50Km范围内任务价格总和越大完成越差；
		对5km范围内有至少2人及2个任务的任务，50Km范围内会员任务总数越大、5个任务平均距离越远、50Km范围内任务价格总和越高则任务完成越好，
		50Km范围内会员信誉总和越高、会员人数越多、10个任务平均距离越远则完成越差；
		常理认为任务价格总数越高，任务完成越好；但对任务竞争度小的任务，远距离的任务价格优势会明显降低本任务的吸引力；
		而对任务竞争度大的任务，远距离的价格优势会较小的提高本任务的吸引力。
		常理认为会员信誉度总和对任务完成起促进作用，但由于信誉度过于压低了任务价格，任务价格反而降低了任务完成率。
		常理认为距离越远任务完成越差，但本题任务距离对任务完成的影响不大，说明本任务是会员随意完成；
		对任务竞争度大的任务，50Km范围内会员任务总数带动了任务完成；对任务竞争度小的任务，50Km范围内任务总数有效的带动了任务完成。
	c、直接观察
		根据任务价格-数量分布规律，将任务价格区间分为65-70，70-75，75，80，85共5个区间，统计得相应任务数量和完成情况
		价格区间	任务数量		任务完成度
		65-70		510				54.12%
		70-75		207				74.4%
		75			78				75.65%
		80			13				69.23%
		85			27				88.89%
		总体		835				62.5%	
		任务成败应该受任务获得、任务付出、任务竞争关系影响。本题中任务获得用任务价格度量，任务付出用任务距会员中心的距离度量，任务竞争关系用
		5km范围内任务数、会员数、价格总和等方式度量。
		按任务距会员中心的距离从远到近。每22个任务1组，计算每组的成功概率。通过分析各组成功概率与其它因素的成败因素图，可以得到：
		1.任务距会员中心的距离对完成概率呈现两头低，中间高的态势。最高区域在2附近。近距离区由于价格压低的原因，呈现特别的低值。
		距离大于3.5的区域由于价格抬高的原因，完成概率呈现特别的高值。
		2.价格因素对成功概率起很大影响。平均价格高于16的成功概率大于80。
		3.5km范围内任务数越高，任务完成概率越低。
		因此，任务未完成的原因主要是任务间竞争关系强、任务定价过低的影响。整个任务付出对任务完成作用均衡，未表现出距离远的任务完成难度过大的特征。
		任务价格对任务完成起正激励作用，任务价格越高任务完成越好。
		任务间竞争关系越高，任务完成越差。
	d、结论：
		任务未完成的原因是价格低、周围任务竞争大、50Km范围内任务总数小、会员所选任务少。
10、新的定价方案
	考虑到原定价方案对信誉度高的任务定价过低，
		
			








			
		


		
		
		
		
		
