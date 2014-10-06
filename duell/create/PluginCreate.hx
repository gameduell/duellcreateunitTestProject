/**
 * @autor kgar
 * @date 4.09.2014.
 * @company Gameduell GmbH
 */
package duell.create;

import duell.defines.DuellDefines;
import duell.objects.DuellLib;
import duell.helpers.TemplateHelper;

class PluginCreate
{
    public function new()
    {

    }

    public function run(args : Array<String>) : String
    {
        if (sys.FileSystem.exists(haxe.io.Path.join([Sys.getCwd(), duell.defines.DuellDefines.PROJECT_CONFIG_FILENAME])))
        {
            throw "Folder already has a " + duell.defines.DuellDefines.PROJECT_CONFIG_FILENAME;
        }

        TemplateHelper.recursiveCopyTemplatedFiles(haxe.io.Path.join([DuellLib.getDuellLib("duellcreateunitTestProject").getPath(),"template"]), Sys.getCwd(), null, null);

        return "success";
    }
}