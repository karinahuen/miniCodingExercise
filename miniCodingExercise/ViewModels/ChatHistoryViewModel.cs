using miniCodingExercise.Models;

namespace miniCodingExercise.ViewModels
{
    public class ChatHistoryViewModel
    {
        public int userId { get; set; }
        public string? username { get; set; }
        public string? displayname { get; set; }

        public List<ChatHistoary> charHistoryList { get; set; }

    }
}
