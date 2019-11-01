using System;
using MediaWorld.Domain.Abstracts;

namespace MediaWorld.Domain.Models
{
   public class Photo : AVideo 
   {
       public Photo()
       {
           Initialize();
       }

       public Photo(string title, TimeSpan duration, int frameRate)
       {
           Initialize(title, duration, frameRate);
       }

       public void Initialize(string title="Untitled", TimeSpan duration= new TimeSpan(), int frameRate=1)
       {
           Title = title;
           Duration = duration;
           FrameRate = frameRate;
       }
   }
}