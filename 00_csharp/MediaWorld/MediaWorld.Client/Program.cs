using System;
using MediaWorld.Domain.Singletons;
using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Models;
using MediaWorld.Domain.Factories;
using MediaWorld.Storing.Repositories;
using Serilog;

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
            Play();
            Log.Warning("end of Main Method");
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
                mediaPlayer.Execute(item.Play, item);
            }
        }
    }
}
