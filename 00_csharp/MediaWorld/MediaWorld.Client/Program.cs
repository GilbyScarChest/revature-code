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
        /// Starts the project
        /// </summary>
        public static void Main()
        {
            Play();
        }

        private static void Play()
        {
            var mediaPlayer = MediaPlayerSingleton.GetInstance();

            Music s = new Song();
            Music a = new Audible();

            mediaPlayer.Play(s);
            mediaPlayer.Play(a);
        }
    }
}
