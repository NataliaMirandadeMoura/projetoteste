using Microsoft.Extensions.DependencyInjection;
using ONS.SDK.Configuration;
using ONS.SDK.Context;
using ONS.SDK.Domain.ProcessMemory;
using ONS.SDK.Services.EventManager;

namespace ONS.SAGER.Calculo.Business.Impl
{
    public class DomainServiceBase
    {
        public IContext Context => SDKConfiguration.ServiceProvider.GetService<IExecutionContext>()
            .ExecutionParameter?.Context;

        public IEventManagerService EventManagerService => SDKConfiguration.ServiceProvider.GetService<IEventManagerService>();

        protected void EmitEvent<T>(string eventName, T payload, bool disableSaveContext = true, bool reuseContext = true, bool afterExecution = false) where T : IPayload
        {
            var eventOut = new MemoryEvent()
            {
                Name = eventName,
                Payload = payload
            };

            EmitEvent(eventOut, disableSaveContext, reuseContext, afterExecution);
        }

        protected void EmitEvent(MemoryEvent eventOut, bool disableSaveContext = true, bool reuseContext = true, bool afterExecution = false)
        {
            if (Context != null && reuseContext)
            {
                // Reusando o contexto
                var eventContext = Context.GetEvent();

                eventOut.InstanceId = Context.InstanceId;
                eventOut.Tag = eventContext.Tag;
                eventOut.Branch = eventContext.Branch;
                eventOut.Reprocess = eventContext.Reprocess;

                if (!afterExecution)
                {
                    Context.Memory.Event.Name = eventOut.Name;
                    Context.Memory.Event.Payload = eventOut.Payload;
                    Context.GetEvent().SetPayload((IPayload)eventOut.Payload);
                    Context.DisableSaveContext = disableSaveContext;

                    var processMemoryService =
                        (SDK.Services.ProcessMemory.IProcessMemoryService)SDK.Configuration.SDKConfiguration.ServiceProvider.GetService(
                            typeof(SDK.Services.ProcessMemory.IProcessMemoryService));
                    processMemoryService.Commit(Context.UpdateMemory());
                }
            }

            if (!afterExecution)
            {
                EventManagerService.Push(eventOut);
            }
            else
            {
                Context.EventsToSend.Add(eventOut);
            }
        }
    }
}
