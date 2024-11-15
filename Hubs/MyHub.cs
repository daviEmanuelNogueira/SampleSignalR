using Microsoft.AspNetCore.SignalR;

namespace SampleSignalR.Hubs;

public class MyHub : Hub
{
    public async Task BlockInput(string connectionId)
    {
        await Clients.Others.SendAsync("BlockInput", connectionId);
    }
    public async Task UnblockInput()
    {
        await Clients.All.SendAsync("UnblockInput");
    }

    public async Task OnWriting(string text)
    {
        await Clients.All.SendAsync("OnWriting", text);
    }
}