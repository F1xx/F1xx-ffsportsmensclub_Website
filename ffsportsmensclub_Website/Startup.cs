using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ffsportsmensclub_Website.Startup))]
namespace ffsportsmensclub_Website
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
