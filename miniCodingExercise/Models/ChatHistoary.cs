using System.ComponentModel.DataAnnotations;

namespace miniCodingExercise.Models
{
    public class ChatHistoary
    {
        [Key]
        public int message_id { get; set; }
        public string? message_content { get; set; }
        public DateTime? message_date { get; set; }
        public string? responsed_content { get; set; }
        public string? admin_display_name { get; set; }
        public DateTime? responsed_date { get; set; }
    }
}
