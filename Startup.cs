using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EXPERIENCIA2._1.Startup))]
namespace EXPERIENCIA2._1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
