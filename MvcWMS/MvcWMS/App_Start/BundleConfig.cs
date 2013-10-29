using System.Web;
using System.Web.Optimization;
using System;

namespace MvcWMS
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254725
        public static void AddDefaultIgnorePatterns(IgnoreList ignoreList)
        {
            if (ignoreList == null)
                throw new ArgumentNullException("ignoreList");
            ignoreList.Ignore("*.intellisense.js");
            ignoreList.Ignore("*-vsdoc.js");
            ignoreList.Ignore("*.debug.js", OptimizationMode.WhenEnabled);
            //ignoreList.Ignore("*.min.js", OptimizationMode.WhenDisabled);
            //ignoreList.Ignore("*.min.css", OptimizationMode.WhenDisabled);
        }

        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/knockout").Include(
           "~/Scripts/knockout-{version}.js",
           "~/Scripts/knockout-{version}.debug.js"));

            bundles.Add(new ScriptBundle("~/bundles/koGrid").Include(
                        "~/Scripts/koGridt-{version}.js",
                        "~/Scripts/koGrid-{version}.debug.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                        "~/Scripts/bootstrap.min.js",
                        "~/Scripts/bootstrap-collapse.js",
                        "~/Scripts/notifier.js"));
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                       "~/Content/site.css",
                       "~/Content/KoGrid.css",
                       "~/Content/ie.css",
                       "~/Content/print.css",
                       "~/Content/screen.css"
                       ));


            bundles.Add(new StyleBundle("~/Content/themes/base/css").Include(
                        "~/Content/themes/base/jquery.ui.core.css",
                        "~/Content/themes/base/jquery.ui.resizable.css",
                        "~/Content/themes/base/jquery.ui.selectable.css",
                        "~/Content/themes/base/jquery.ui.accordion.css",
                        "~/Content/themes/base/jquery.ui.autocomplete.css",
                        "~/Content/themes/base/jquery.ui.button.css",
                        "~/Content/themes/base/jquery.ui.dialog.css",
                        "~/Content/themes/base/jquery.ui.slider.css",
                        "~/Content/themes/base/jquery.ui.tabs.css",
                        "~/Content/themes/base/jquery.ui.datepicker.css",
                        "~/Content/themes/base/jquery.ui.progressbar.css",
                        "~/Content/themes/base/jquery.ui.theme.css"));

            bundles.Add(new ScriptBundle("~/bundles/q").Include(
            "~/Scripts/q.js",
            "~/Scripts/q.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/breeze").Include(
                        "~/Scripts/breeze.js",
                        "~/Scripts/breeze.debug.js",
                        "~/Scripts/breeze.intellisense.js"));

            bundles.Add(new ScriptBundle("~/bundles/logger").Include(
            "~/Scripts/App/Logger.js"));

            bundles.Add(new ScriptBundle("~/bundles/app").Include(
                        "~/Scripts/App/ProposalDataService.js",
                        "~/Scripts/App/ProposalViewModel.js",
                        "~/Scripts/App/main.js"));

        }
    }
}