namespace MediaWorld.Domain.Models
{
    public class MediaSingleton
    {
        private static readonly string _instance = "mediaplayer";

        private MediaSingleton() {}

        public static string GetInstance()
        {
            return _instance;
        }
    }
}