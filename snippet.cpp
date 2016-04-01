int RGServiceHandler::parseMsg(int msgType, int msgLen, char * ptr_buffer, messaging::sender & handler)
{
    LogStream logStream(Application::instance().logger());
    std::string strMsgType;

    if (msgType == MSG_START_VA_TASK
            || msgType == MSG_STOP_VA_TASK
            || msgType == MSG_USER_LOGIN
            || msgType == MSG_USER_LOGOUT
            || msgType == MSG_USER_HEARTBEAT
            || msgType == MSG_USER_LOGIN
            || msgType == MSG_USER_LOGIN)
    {
        logStream.error() << "6_recv\t [msg]: Wrong" << std::endl;
        return false;
    }
    else if (msgType == MSG_START_VA_TASK_ACK)
    {
        SMsgStartVATaskAck recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SMsgUserLoginAck";
    }
    else if (msgType == MSG_VA_TASK_END_NOTIFY)
    {
        SMsgVATaskEndNotify recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SMsgVATaskEndNotify";
    }
    else if (msgType == MSG_VA_TASK_RESULT_NOTIFY)
    {
        SMsgVATaskResultNotify recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SMsgVATaskResultNotify";
    }
    else if (msgType == MSG_VA_TASK_EXEC_FAIL_NOTIFY)
    {
        SMsgVATaskExecFailNotify recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SMsgVATaskExecFailNotify";
    }
    else if (msgType == MSG_USER_LOGIN_ACK)
    {
        SMsgUserLoginAck recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "MSG_USER_LOGIN_ACK";
    }
    else if (msgType == Surgard::Basic)
    {
        SurgardBasic recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SurgardBasic";
    }
    else if (msgType == Surgard::Heartbeat)
    {
        SurgardHeartbeat recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SurgardHeartbeat";
    }
    else if (msgType == Surgard::ContactID)
    {
        SurgardContactID recv_msg;
        memcpy(&recv_msg, ptr_buffer, msgLen);
        handler.send(recv_msg);
        strMsgType = "SurgardContactID";
    }
    else
    {
        logStream.error() << "6_recv\t [msg] error:" << msgType << std::endl;
        return false;
    }

    logStream.information() << "6_recv\t [msg]: " << strMsgType << std::endl;
    return true;
}
void RGServiceHandler::startTask(const std::string & riskPoint)
{
    LogStream logStream(Application::instance().logger());
    //std::cout << "task " << riskPoint << " start" << std::endl;
    std::string riskPointReal = riskPoint;              ///< 获取 风险点
    //riskPointReal = "S003";
    logStream.debug() << "Request2Task: RiskPoint:" << riskPointReal << std::endl;

    if (riskPointReal != "")
    {
        int taskType = AppConfig::instance().getVAType(riskPointReal);                              ///< 获取 任务类型
        int videoType = AppConfig::instance().getVideoType(riskPointReal);                      ///< 获取 视频类型
        logStream.debug() << "Request2Task: TaskType:" << taskType << std::endl;
        logStream.debug() << "Request2Task: VideoType:" << videoType << std::endl;

        if (taskType >= 0 && videoType >= 0)
        {
            // 遍历所有设备，开启实时任务检测
            for (auto it_facility = m_mFacilityInfo.begin(); it_facility != m_mFacilityInfo.end(); it_facility++)
            {
                SMsgStartVATask vaTask = RequestGen::Util::makeVAMsg<SMsgStartVATask>(0, MSG_START_VA_TASK);

                if (createTaskWithoutCoreData(vaTask, riskPointReal, taskType, videoType))          ///< 生成 分析任务
                {
                    std::string realtime;

                    if (riskPointReal == "S011" || riskPointReal == "S012" || riskPointReal == "S013")
                    {
                        realtime = " realtime";
                    }
                    else
                    {
                        realtime = " not realtime";
                    }

                    strncpy(vaTask.sDeviceIP, (*it_facility).second.IP.c_str(), (*it_facility).second.IP.length());
                    vaTask.nDevicePort = (*it_facility).second.port;
                    vaTask.nDeviceChannelID = (*it_facility).second.channelNo;
                    logStream.information() << "9_task start riskpoint" << riskPoint << " [" << AppConfig::instance().RiskPoint2AnalyseName().at(riskPoint) << "] " << realtime << std::endl;
                    _sender_srv->get_sender().send(vaTask);
                    logStream.debug() << "Socket Send:(" << sizeof(vaTask) << ")" << std::endl;
                    logStream.debug() << "\t\tlen=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.wMsgLen)
                                      << "\n\t\tmagic=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.wMagicNumber)
                                      << "\n\t\ttype=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.uMsgType)
                                      << "\n\t\tsequeue=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.uMsgSeq)
                                      << "\n\t\tip=" << vaTask.sDeviceIP
                                      << "\n\t\tport=" << vaTask.nDevicePort
                                      << "\n\t\tPriority=" << vaTask.nTaskPriority
                                      << "\n\t\tVAType=" << vaTask.nTaskVAType
                                      << "\n\t\tChannelID=" << vaTask.nDeviceChannelID
                                      << "\n\t\tBeginTime=" << vaTask.sVACheckBeginTime
                                      << "\n\t\tEndTime=" << vaTask.sVACheckEndTime << std::endl;
                }
            }

            for (auto it_facility = m_mFacilityInfoDVR.begin(); it_facility != m_mFacilityInfoDVR.end(); it_facility++)
            {
                SMsgStartVATask vaTask = RequestGen::Util::makeVAMsg<SMsgStartVATask>(0, MSG_START_VA_TASK);

                if (createTaskWithoutCoreData(vaTask, riskPointReal, taskType, videoType))          ///< 生成 分析任务
                {
                    std::string realtime;

                    if (riskPointReal == "S011" || riskPointReal == "S012" || riskPointReal == "S013")
                    {
                        realtime = " realtime";
                    }
                    else
                    {
                        realtime = " not realtime";
                    }

                    strncpy(vaTask.sDeviceIP, (*it_facility).second.IP.c_str(), (*it_facility).second.IP.length());
                    vaTask.nDevicePort = (*it_facility).second.port;
                    vaTask.nDeviceChannelID = (*it_facility).second.channelNo;
                    logStream.information() << "9_task start riskpoint" << riskPoint << " [" << AppConfig::instance().RiskPoint2AnalyseName().at(riskPoint) << "] " << realtime << std::endl;
                    _sender_srv->get_sender().send(vaTask);
                    logStream.debug() << "Socket Send:(" << sizeof(vaTask) << ")" << std::endl;
                    logStream.debug() << "\t\tlen=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.wMsgLen)
                                      << "\n\t\tmagic=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.wMagicNumber)
                                      << "\n\t\ttype=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.uMsgType)
                                      << "\n\t\tsequeue=" << Poco::ByteOrder::fromNetwork(vaTask.sMsgHeader.uMsgSeq)
                                      << "\n\t\tip=" << vaTask.sDeviceIP
                                      << "\n\t\tport=" << vaTask.nDevicePort
                                      << "\n\t\tPriority=" << vaTask.nTaskPriority
                                      << "\n\t\tVAType=" << vaTask.nTaskVAType
                                      << "\n\t\tChannelID=" << vaTask.nDeviceChannelID
                                      << "\n\t\tBeginTime=" << vaTask.sVACheckBeginTime
                                      << "\n\t\tEndTime=" << vaTask.sVACheckEndTime << std::endl;
                }
            }

            //else
            //{
            //  logStream.information() << "task create NOT " << riskPointReal << std::endl;
            //}
        }
    }
}
void RGServiceHandler::onReceiveRemoteData(RemoteData * received_data)
{
    LogStream logStream(Application::instance().logger());
    logStream.debug("onReceiveRemoteData");

    if (received_data->type() == RequestDataTypeBankRiskPoint)
    {
        auto data = (reinterpret_cast<RemoteDataBankRiskPoint *>(received_data))->getData();
        {
            logStream.information() << "2_rsp\t BankRiskPointData:" << data.size() << std::endl;
            std::lock_guard<std::mutex> lk(m_mtx_mBankRiskPoint);
            std::for_each(data.begin(), data.end(),
                          [&](const BankRiskPointData & elem)
            {
                if (m_mBankRiskPointData.find(elem.riskPointCode) == m_mBankRiskPointData.end())
                {
                    m_mBankRiskPointData.insert(std::make_pair(elem.riskPointCode, elem));
                }
            }
                         );
        }
    }

    if (received_data->type() == RequestDataTypeCounterTailRelation)
    {
        auto data = (reinterpret_cast<RemoteDataCounterTailRelation *>(received_data))->getData();
        {
            logStream.information() << "2_rsp\t CounterTailRelationInfo:" << data.size() << std::endl;
            std::lock_guard<std::mutex> lk(m_mtx_mCounterTailRelationInfo);
            std::for_each(data.begin(), data.end(),
                          [&](const CounterTailRelationInfo & elem)
            {
                if (m_mCounterTailRelationInfo.find(elem.tailNumber) == m_mCounterTailRelationInfo.end())
                {
                    m_mCounterTailRelationInfo.insert(std::make_pair(elem.tailNumber, elem));
                }
            }
                         );
        }
    }

    if (received_data->type() == RequestDataTypeFacility
            && reinterpret_cast<RemoteDataFacility *>(received_data)->getFType() == DeviceType_IPC)
    {
        auto data = (reinterpret_cast<RemoteDataFacility *>(received_data))->getData();
        {
            logStream.information() << "2_rsp\t FacilityInfo:" << data.size() << std::endl;
            std::lock_guard<std::mutex> lk(m_mtx_mFacilityInfo);
            std::for_each(data.begin(), data.end(),
                          [&](const FacilityInfo & elem)
            {
                if (m_mFacilityInfo.find(elem.counterNumber) == m_mFacilityInfo.end())
                {
                    m_mFacilityInfo.insert(std::make_pair(elem.counterNumber, elem));
                }
            }
                         );
        }
    }

    if (received_data->type() == RequestDataTypeFacility
            && reinterpret_cast<RemoteDataFacility *>(received_data)->getFType() == DeviceType_DVR)
    {
        auto data = (reinterpret_cast<RemoteDataFacility *>(received_data))->getData();
        {
            logStream.information() << "2_rsp\t FacilityInfo:" << data.size() << std::endl;
            std::lock_guard<std::mutex> lk(m_mtx_mFacilityInfoDVR);
            std::for_each(data.begin(), data.end(),
                          [&](const FacilityInfo & elem)
            {
                if (m_mFacilityInfoDVR.find(elem.facilityId) == m_mFacilityInfoDVR.end())
                {
                    m_mFacilityInfoDVR.insert(std::make_pair(elem.facilityId, elem));
                }
            }
                         );
        }
    }

    if (received_data->type() == RequestDataTypeBusinessCore)
    {
        auto data = (reinterpret_cast<RemoteDataBusinessCore *>(received_data))->getData();
        {
            logStream.information() << "2_rsp\t BusinessCoreData:" << data.size() << std::endl;
            int count = 0;
            std::for_each(data.begin(), data.end(),
                          [&](const BusinessCoreData  & elem)
            {
                m_qBusinessCoreData.push(elem);
                logStream.information() << "3_ins\t coredata:\t[" << count << "]\t=>\t" << m_qBusinessCoreData.size() << "]" << std::endl;
            }
                         );
        }
    }

    if (received_data->type() == RequestDataTypeWorkTimeInfo)
    {
        auto data = static_cast<RemoteDataWorkTimeInfo *>(received_data)->getData();
        logStream.information() << "2_rsp\t WorkTimeInfo:" << data.size() << std::endl;
        // save data to file system
        WorkTimeInfoConfig::instance().setData(data);
        WorkTimeInfoConfig::instance().save();
        _workTimeInfoUpdated = true;
    }
}
