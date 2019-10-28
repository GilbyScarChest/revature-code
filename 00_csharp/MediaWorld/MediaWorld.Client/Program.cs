using System;
using MediaWorld.Domain.Singletons;
using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Models;

namespace MediaWorld.Client
{
    /// <summary>
    /// contains the start point
    /// </summary>
    internal class Program
    {
        /// <summary>
        /// Starts the project
        /// </summary>
        private static void Main()
        {
            Play();
        }

        private static void Play()
        {
            var mediaPlayer = MediaPlayerSingleton.Instance;

            AMedia song = new Song();
            AMedia movie = new Movie();

            mediaPlayer.Execute("play", song);
            mediaPlayer.Execute("play", movie);
        }
    }
}
