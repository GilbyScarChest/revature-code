using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace PizzaBox.Client
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) // attaching middleware to the request.
        {
            // services.AddControllersWithViews();
            services.AddMvc(o => o.EnableEndpointRouting = false);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env) // execute the middleware on that request.
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                // app.UseHsts();
            }
            // app.UseHttpsRedirection();
            // app.UseStaticFiles();

            // app.UseRouting();
            app.UseMvc();
            app.UseWelcomePage(); // terminal middleware -- The buck stops here

        //     app.UseAuthorization();

        //     app.UseEndpoints(endpoints =>
        //     {
        //         endpoints.MapControllerRoute(
        //             name: "default",
        //             pattern: "{controller=Home}/{action=Index}/{id?}");
        //     });
        }
    }
}
