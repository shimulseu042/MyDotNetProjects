using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(University_CourseAndResult_ManagementSysApp.Startup))]
namespace University_CourseAndResult_ManagementSysApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
