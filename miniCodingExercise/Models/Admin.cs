namespace miniCodingExercise.Models
{
    public class Admin
    {
        public int Id { get; set; }
        public string admin_name { get; set; }
        public string admin_display_name { get; set; }
        public int level { get; set; }
        public string? is_valid { get; set; }
    }
}
