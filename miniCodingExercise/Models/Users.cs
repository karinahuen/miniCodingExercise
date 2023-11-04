using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace miniCodingExercise.Models
{
    public class Users
    {
        public int Id { get; set; }
        public string? username { get; set; }
        public string? displayname { get; set; }
        public string? is_valid { get; set; }
    }
}
