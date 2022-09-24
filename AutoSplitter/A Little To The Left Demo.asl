state("A Little To The Left")
//state("UnityPlayer")
{
    int chapter : "UnityPlayer.dll", 0x019E2AF8, 0xA8, 0x28, 0x398;
}

startup
{
    /* if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | A Little to the Left",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    } */
}

start
{
    return current.chapter > old.chapter && old.chapter == 0;
}

onStart
{
    vars.setStartTime = true;
}

split
{
    //return old.chapter != 0 && current.chapter != old.chapter;
    return current.chapter != old.chapter;
}

gameTime 
{
    if(vars.setStartTime)
    {
        vars.setStartTime = false;
        return TimeSpan.FromSeconds(0f); //(vars.startTimeOffset);
    }
    //return TimeSpan.FromSeconds(0f);
}

exit
{
    timer.IsGameTimePaused = true;
}
