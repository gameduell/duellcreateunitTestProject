/**
 * @autor kgar
 * @date 4.09.2014.
 * @company Gameduell GmbH
 */
package duell.create;

import duell.defines.DuellDefines;
import duell.objects.DuellLib;
import duell.helpers.TemplateHelper;
import duell.helpers.CreationHelper;

class PluginCreate
{
    public function new()
    {

    }

    public function run() : String
    {
        if (sys.FileSystem.exists(haxe.io.Path.join([Sys.getCwd(), duell.defines.DuellDefines.PROJECT_CONFIG_FILENAME])))
        {
            throw "Folder already has a " + duell.defines.DuellDefines.PROJECT_CONFIG_FILENAME;
        }

        var path = CreationHelper.getProjectFolder("unitTestProject");
        TemplateHelper.recursiveCopyTemplatedFiles(haxe.io.Path.join([DuellLib.getDuellLib("duellcreateunitTestProject").getPath(),"template"]), path, null, null);

        return "success";
    }
}