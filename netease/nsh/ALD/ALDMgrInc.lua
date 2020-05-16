MODULE("ALD")
MODULE_DEPEND("ALD")
MODULE_DATA("ALD")

RegistClassMember(CALDMgr, 'index')
RegistClassMember(CALDMgr, 'root_log')
RegistClassMember(CALDMgr, 'root_python')
RegistClassMember(CALDMgr, 'root_nsh')
RegistClassMember(CALDMgr, 'root_lua')
RegistClassMember(CALDMgr, 'python')
RegistClassMember(CALDMgr, 'config')
RegistClassMember(CALDMgr, 'time_per_frame')
RegistClassMember(CALDMgr, 'stage')
RegistClassMember(CALDMgr, 'scene')
RegistClassMember(CALDMgr, 'msg')
RegistClassMember(CALDMgr, 'task_name')
RegistClassMember(CALDMgr, 'task')
RegistClassMember(CALDMgr, 'player')
RegistClassMember(CALDMgr, 'offset_frame_time')
RegistClassMember(CALDMgr, 'GetFrameTime')
RegistClassMember(CALDMgr, 'offset_global_time')
RegistClassMember(CALDMgr, 'GetGlobalTime')

RegistClassMember(CALDMgr, "m_Usable")
RegistClassMember(CALDMgr, "m_SJTXPlay_Usable")
RegistClassMember(CALDMgr, "m_Debug")
RegistClassMember(CALDMgr, "m_ALDPlays")
RegistClassMember(CALDMgr, "m_Actions")
RegistClassMember(CALDMgr, "m_PipeId")
RegistClassMember(CALDMgr, "m_IsBinaryCdTime")
RegistClassMember(CALDMgr, "m_SJTXPlays")
RegistClassMember(CALDMgr, "m_MaxNumber_SJTX")
RegistClassMember(CALDMgr, "m_MaxNumber_WXSL")
RegistClassMember(CALDMgr, "m_LPJWPlays")
RegistClassMember(CALDMgr, "m_MaxNumber_LPJW")
RegistClassMember(CALDMgr, "m_MaxNumber_LPJWRecord")
RegistClassMember(CALDMgr, "m_LPJWDifficulty")
RegistClassMember(CALDMgr, "m_LPJWForceSkillCD")
RegistClassMember(CALDMgr, "m_LPJWPlayId")
RegistClassMember(CALDMgr, "m_LPJWRecordPlays")
RegistClassMember(CALDMgr, "m_LPJWRecalls")
RegistClassMember(CALDMgr, "m_playId2Gid")

RegistClassMember(CServerPlayer, "m_MoveCallBack_DLAI") -- 玩家移动时会触发的回调函数
RegistClassMember(CServerPlayer, "m_SkillCallBack_DLAI") -- 玩家释放技能时会触发的回调函数
RegistClassMember(CServerPlayer, "m_GamePlayCallBack_DLAI") -- 玩家战斗结束时会触发的回调函数
RegistClassMember(CALDMgr, 'recall_skill') -- 用来记录技能监听信息

require('ALD/ALDMgr')
