using System;
using MediaWorld.Domain.Models;

namespace MediaWorld.Client
{
    /// <summary>
    /// contains the start point
    /// </summary>
    internal class Program
    {
        /// <summary>
        /// starts the application
        /// </summary>
        /// <param name="args"></param>
        public static void Main(string[] args)
        {
            var helper = MediaSingleton.GetInstance();
            // var helper2 = new MediaSingleton();
            Console.WriteLine(helper);
        }
    }
}
