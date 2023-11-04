using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using miniCodingExercise.Data;
using miniCodingExercise.Models;
using NuGet.Protocol;
using System.Collections.Generic;
using System.Text.Json.Nodes;
using miniCodingExercise.ViewModels;
using static Azure.Core.HttpHeader;
using Microsoft.CodeAnalysis.Operations;

namespace miniCodingExercise.Hubs
{
    public class ChatHub : Hub
    {
        private readonly miniCodingExerciseContext db;

        //connect localhost db
        public ChatHub(miniCodingExerciseContext minidb)
        {
            db = minidb;
        }
        public async Task SendMessage(string userID, string userDisplayName, string message)
        {

            int isSuccess = 0;

            //update data to database
            var param = new SqlParameter[]
            {
                new SqlParameter()
                {
                    ParameterName = "@userId",
                    SqlDbType = System.Data.SqlDbType.Int,
                    Value=Int32.Parse(userID)
                },
                new SqlParameter()
                {
                    ParameterName = "@message",
                    SqlDbType = System.Data.SqlDbType.NVarChar,
                    Value=message
                },
                new SqlParameter()
                {
                    ParameterName = "ReturnValue",
                    SqlDbType = System.Data.SqlDbType.Int,
                    Direction = System.Data.ParameterDirection.Output,
                }
            };

          
            var InsertUserMsg = await db.Database.ExecuteSqlRawAsync($"EXEC @returnValue = [dbo].[CreateUserMessage] @userId, @message", param);

            int msgID = (int)param[2].Value;

            if (InsertUserMsg != 0)
            {
                //create response message
                if(CreateResponseMessage(msgID, message) != 0)
                 {
                    //return success
                    isSuccess = 1;

                 }
             }

            await Clients.All.SendAsync("ReceiveMessage", userDisplayName, message, isSuccess, msgID);

        }

        //create response message from db
        public int CreateResponseMessage(int msgId, string msg)
         {
             int isSuccess = 0;
             var createMsgRepsonse = db.Database.ExecuteSqlAsync($"Exec CreateMessageResponse @msgId= {msgId}, @msg={msg}");

             if(createMsgRepsonse != null)
             {

                isSuccess = createMsgRepsonse.Result;
             }


             return isSuccess;
         }

    }
}
