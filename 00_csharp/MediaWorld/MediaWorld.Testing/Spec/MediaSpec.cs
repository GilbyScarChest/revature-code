using System;
using MediaWorld.Domain.Abstracts;
using MediaWorld.Domain.Factories;
using MediaWorld.Domain.Models;
using MediaWorld.Domain.Singletons;
using Moq;
using Xunit;

namespace MediaWorld.Testing.Spec
{
    public class MediaSpec
    {
        AudioFactory af = new AudioFactory();
        VideoFactory vf = new VideoFactory();
        Mock<AMedia> mock;

        public MediaSpec()
        {
            mock = new Mock<AMedia>();
            mock.Setup(am => am.Play()).Returns(false);
        }

        [Fact]

        public void Test_AudioObject()
        {
            //arrange
            var sut = af; // S.U.T. Subject Under Test
            var expected = typeof(Song); // expected outcome

            //act
            var actual = af.Create<Song>() as Song;

            //assert
            Assert.True(expected == actual.GetType());
        }

        // public void Test_VideoPlay()
        // {
        //     var sut = MediaPlayerSingleton.Instance;
        //     var mm = mock.Object;

            

        //     // Assert.True(sut.Execute(mm.Play, mm));
        // }
    }
}