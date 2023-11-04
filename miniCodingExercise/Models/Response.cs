using System.ComponentModel.DataAnnotations;

namespace miniCodingExercise.Models
{
    public class Response
    {
        public int Id { get; set; }
        public int admin_id { get; set; }
        public int message_id { get; set; }
        public string? content { get; set; }
        public string? created_by { get; set; }
        public DateTime created_date { get; set; }
        public string? modified_by { get; set; }
        public DateTime? modified_date { get; set; }
        public List<Response> Responselist = new List<Response>();
    }
}
