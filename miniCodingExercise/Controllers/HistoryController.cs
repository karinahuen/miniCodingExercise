using ExerciseClassLibrary;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using miniCodingExercise.Data;
using miniCodingExercise.ViewModels;
using System.Security.Cryptography;
using System;
using System.Text;
using miniCodingExercise.Models;

namespace miniCodingExercise.Controllers
{
    public class HistoryController : Controller
    {
        private readonly miniCodingExerciseContext db;

        //connect localhost db
        public HistoryController(miniCodingExerciseContext minidb)
        {
            db = minidb;
        }

        public async Task<IActionResult> Index()
        {
            

            string _userId = "0";
            string _username = "";
            string _displayname = "";

            ChatHistoryViewModel chatHistoryViewModel = new ChatHistoryViewModel();

            //check current user. by default user name is test 
            if (!string.IsNullOrEmpty(HttpContext.Session.GetString(CommonValue.sessionUserID)))
            {

                _userId = HttpContext.Session.GetString(CommonValue.sessionUserID);
                _username = HttpContext.Session.GetString(CommonValue.sessionUserName);
                _displayname = HttpContext.Session.GetString(CommonValue.sessionUserDisplayName);

                int userId = 0;
                userId = Int32.Parse(_userId);

                //set current username information
                chatHistoryViewModel.userId = userId;
                chatHistoryViewModel.username = _username;
                chatHistoryViewModel.displayname = _displayname;


                var getChatHistoaryData = getHistoryDataFuncList(userId);
                if (getChatHistoaryData.Count > 0)
                {
                    //get history by userid
                    chatHistoryViewModel.charHistoryList = getChatHistoaryData;
                }
            }

            return View(chatHistoryViewModel);

        }
        public List<ChatHistoary> getHistoryDataFuncList(int _userId)
        {
            return  db.ChatHistory.FromSql($"[dbo].[GetUserMessageHistoryByUserId] @userId = {_userId}").ToList();

        }

        [HttpPost]
        public IActionResult ExportChatHistory(ChatHistoryViewModel chatHistory)
        {
            string result = "";
            var getChatHistoaryData = getHistoryDataFuncList(chatHistory.userId);
            ChatHistoryViewModel chatHistoryViewModel = new ChatHistoryViewModel();
            if (getChatHistoaryData != null)
            {
                if (getChatHistoaryData.Count > 0)
                {
                    //get history by userid
                    chatHistoryViewModel.charHistoryList = getChatHistoaryData;
                    foreach(var item in chatHistoryViewModel.charHistoryList)
                    {
                        result += "➜" + chatHistory.displayname + " said " + item.message_content + " (" + item.message_date + ")\n";
                        result += "↳" + item.admin_display_name + " : " + item.responsed_content + " (" + item.responsed_date + ")\n";
                    }

                    result += "\n\n\n\nPlease don't share data to anyone.";
                }
            }


            //export as text file
            byte[] fileByte = Encoding.UTF8.GetBytes(result);

            string fileName = "ChartHistory.txt";
            string contentType = "text/plain";

            return File(fileByte, contentType, fileName);
        }



    }
}
