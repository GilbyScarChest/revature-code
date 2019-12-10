using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PizzaBox.Client.Models;

namespace PizzaBox.Client.Controllers
{
    [Route("/[controller]/[action]")] // Route Filter
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [HttpGet("{id}")] // filter parameter -- has no baring on the Route parameters

        public IActionResult Index(string id)
        {
            // dynamic fred = "string";
            // fred = 100;
            // fred = true;

            // dynamic ViewBag1 = new object();
            // ViewBag1.fred = 100;

            ViewBag.Name = id;
            ViewData["Name"] = id;
            TempData["Name"] = id;
            return View(new Pizza());
        }

        [HttpPost()]
        public IActionResult Order(Pizza p)
        {
            if (ModelState.IsValid)
            {
                ViewBag.Pizza = p;
                return View("Index", new Pizza());
            }

            return View("Index", p);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
