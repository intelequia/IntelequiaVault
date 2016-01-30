using DotNetNuke.Services.Scheduling;
using System;
using Intelequia.Secure.Data;

namespace Intelequia.Secure.Spa.Task
{
    public class DeleteMessages : SchedulerClient
    {

        public DeleteMessages(ScheduleHistoryItem objScheduleHistoryItem)
        {
            ScheduleHistoryItem = objScheduleHistoryItem;
        }

        /// <summary>
        /// Elimina los mensajes caducados
        /// </summary>
        public override void DoWork()
        {
            try
            {
                ScheduleHistoryItem.Succeeded = MessageRepository.Instance.DeleteExpiredMessages();
            }
            catch (Exception ex)
            {
                // report a failure
                ScheduleHistoryItem.Succeeded = false;

                // log the exception into the scheduler framework
                ScheduleHistoryItem.AddLogNote("EXCEPTION" + ex);

                // call the Errored method
                Errored(ref ex);

                // log the exception into the DNN core
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex);
            }
        }
    }

}