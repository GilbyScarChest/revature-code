﻿using System;
using MediaWorld.Domain.Singletons;
using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Models;
using MediaWorld.Domain.Factories;
using MediaWorld.Storing.Repositories;
using Serilog;
using System.Threading;
using System.Threading.Tasks;

namespace MediaWorld.Client
{
    /// <summary>
    /// contains the start point
    /// </summary>
    internal class Program
    {
        private static MediaRepository _repository = new MediaRepository();

        /// <summary>
        /// Starts the project
        /// </summary>
        private static void Main()
        {
            var program = new Program();
            program.ApplicationStart();
            // Play();
            MagicAsync().GetAwaiter().GetResult();
            Console.WriteLine("end of Main Method");
            // Log.Warning("end of Main Method");
        }

        private void ApplicationStart()
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .WriteTo.Console()
                .WriteTo.File("log.txt")
                .CreateLogger();
        }

        private static void Play()
        {
            Log.Information("Play Method");
            var mediaPlayer = MediaPlayerSingleton.Instance;

            foreach (var item in _repository.MediaLibrary)
            {
                Log.Debug("{@item}", item.Title); // "@" means I want the literal object. Not the "representation".
                //Log.Debug("{first} {second}", item.Title, item.Duration);
                mediaPlayer.Execute(item.Play, item);
            }
        }

        private static void MagicThread()
        {
            var t1 = new Thread(() => { Run("A"); });
            var t2 = new Thread(() => { Run("B"); });

            t1.Start();
            t2.Start();

            t1.Join();
            t2.Join();
        }
        private static void MagicTasks()
        {
            var t1 = new Task(() => { Run("A"); });
            var t2 = new Task(() => { Run("B"); });

            t1.Start();
            t2.Start();

            Task.WaitAll(new Task[] {t1, t2}, 1000); //wait for both t1 and t2 for 1 second

        }

        private static async Task MagicAsync()
        {
            await Task.Run(() => { Run("C"); });
        }

        private static void Run(string s)
        {
            for (var x = 0; x < 100; x += 1)
            {
                Console.Write(s);
            }
        }
    }
}
