using System;
using MediaWorld.Domain.Interfaces;

namespace MediaWorld.Domain.Singletons
{
    public class AudioSingleton : IPlayer
    {
        public bool PowerDown()
        {
            throw new NotImplementedException();
        }

        public bool PowerUp()
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

        public bool VolumeUp()
        {
            throw new NotImplementedException();
        }
    }
}