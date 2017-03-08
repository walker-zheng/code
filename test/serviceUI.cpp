
void CtrlCenterSession::post(AlarmData && data)
{
    if (_connected)
    {
        auto  fut = CtrlCenterService::saveAlarm(std::move(data));
        async_queue.push(std::make_pair(fut, data));
    }
    else
    {
        cacheAlarm(data);
    }
}
void CtrlCenterSession::run()
{
    for (;;)
    {
        auto &&  data = async_queue.pop();

        if (!data.first.get())  // post failed
        {
            saveAlarm(std::move(data.second));
            getLogger().error("post saveAlarm failed:");
            //async_queue.push(std::move(data));
        }
    }
}