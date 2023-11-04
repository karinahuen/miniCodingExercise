using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using miniCodingExercise.Data;
using ExerciseClassLibrary;
using miniCodingExercise.Models;
using miniCodingExercise.ViewModels;
using Microsoft.AspNetCore.Http;
using System.Net;

namespace miniCodingExercise.Controllers
{
    public class ChatroomController : Controller
    {
        private readonly miniCodingExerciseContext db;

        //connect localhost db
        public ChatroomController(miniCodingExerciseContext minidb)
        {
            db = minidb;
        }

        public async Task<IActionResult> Index()
        {
            var getUserInformation = db.Users.FromSqlRaw("GetUsersInformation").ToList();
            
            string _userId = "0";
            string _username = "";
            string _displayname = "";


            //check the valid data
            if(getUserInformation != null) {
                if (getUserInformation.Count > 0)
                {
                    //check current user. by default user name is test 
                    if (string.IsNullOrEmpty(HttpContext.Session.GetString(CommonValue.sessionUserID)))
                    {
                        //set session value
                        HttpContext.Session.SetString(CommonValue.sessionUserID, getUserInformation[0].Id.ToString());
                        HttpContext.Session.SetString(CommonValue.sessionUserName, getUserInformation[0].username);
                        HttpContext.Session.SetString(CommonValue.sessionUserDisplayName, getUserInformation[0].displayname);
                    }
                }
            }

            _userId = HttpContext.Session.GetString(CommonValue.sessionUserID);
            _username = HttpContext.Session.GetString(CommonValue.sessionUserName);
            _displayname = HttpContext.Session.GetString(CommonValue.sessionUserDisplayName);

            UsersChatroomViewModel usersViewModel = new UsersChatroomViewModel()
            {
                Id = Int32.Parse(_userId),
                username = _username,
                displayname = _displayname
            };

            return View(usersViewModel);

        }

        [HttpPost]
        public List<Response> GetInstantResponseDataByMID(int mId)
        {
            var getInstantResponseById = db.Response.FromSql($"[dbo].[GetInstantRepsonseMessageByMsgId] @msgId = {mId}").ToList();
            List<Response> returnList = new List<Response>();
            if (getInstantResponseById.Count > 0)
            {
                returnList = getInstantResponseById;
            }

            return returnList;
        }
    }
}
