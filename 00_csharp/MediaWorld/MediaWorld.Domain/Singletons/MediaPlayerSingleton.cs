using System;
using MediaWorld.Domain.Interfaces;
using MediaWorld.Domain.Abstracts;
using static MediaWorld.Domain.Delegates.ControlDelegate;

namespace MediaWorld.Domain.Singletons
{
    public class MediaPlayerSingleton : IPlayer
    {
        private static readonly MediaPlayerSingleton _instance = new MediaPlayerSingleton();

        public static MediaPlayerSingleton Instance
        {
            get
            {
                return _instance;
            }
        }

        private MediaPlayerSingleton() {}
    
        public void Execute(ButtonDelegate button, AMedia media)
        {
            media.ResultEvent += ResultHandler;
            button();
        }

        public void ResultHandler(AMedia media)
        {
            Console.WriteLine("{0} is playing...", media.Title);
        }

        public bool VolumeUp()
        {
            throw new NotImplementedException();
        }

        public bool VolumeDown()
        {
            throw new NotImplementedException();
        }

        public bool VolumeMute()
        {
            throw new NotImplementedException();
        }

        public bool PowerUp()
        {
            throw new NotImplementedException();
        }

        public bool PowerDown()
        {
            throw new NotImplementedException();
        }
    }
}