using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using miniCodingExercise.Models;
using miniCodingExercise.ViewModels;

namespace miniCodingExercise.Data
{
    public class miniCodingExerciseContext : DbContext
    {
        public miniCodingExerciseContext(DbContextOptions<miniCodingExerciseContext> options)
            : base(options)
        {
        }

       

        public DbSet<miniCodingExercise.Models.Users> Users { get; set; } = default!;
        public DbSet<miniCodingExercise.Models.Response> Response { get; set; } = default!;
        public DbSet<miniCodingExercise.Models.ChatHistoary> ChatHistory { get; set; } = default!;


    }
}
