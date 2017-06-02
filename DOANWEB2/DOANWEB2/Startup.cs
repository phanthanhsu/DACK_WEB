using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DOANWEB2.Startup))]
namespace DOANWEB2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
