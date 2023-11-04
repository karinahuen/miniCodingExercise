
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using miniCodingExercise.Data;
using miniCodingExercise.Hubs;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<miniCodingExerciseContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("miniCodingExerciseContext") ?? throw new InvalidOperationException("Connection string 'miniCodingExerciseContext' not found.")));


// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDistributedMemoryCache();
builder.Services.AddSignalR();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(120);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseSession();
app.MapHub<ChatHub>("/chatBox");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Chatroom}/{action=Index}/{id?}");

app.Run();
