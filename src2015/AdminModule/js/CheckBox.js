function confirmDelete (frm)
        {
            // loop through all elements
           var i = 0;
            for (i=0; i<frm.length; i++)
            {

                    if(frm.elements[i].checked)
                    {
                        return confirm ('Bạn muốn xoá dòng đã chọn?')
                    }
               
            }
            if(i==frm.length)
            {
            alert("Vui lòng chọn ít nhất một dòng.");
            return false;
            }
          
        }
        function select_deselectAll (chkVal, idVal)
        {
            var frm = document.forms[0];
            // Loop through all elements
            for (i=0; i<frm.length; i++)
            {
                // Look for our Header Template's Checkbox
                if (idVal.indexOf ('CheckAll') != -1)
                {
                    // Check if main checkbox is checked, then select or deselect datagrid checkboxes
                    if(chkVal == true)
                    {
                        frm.elements[i].checked = true;
                    }
                    else
                    {
                        frm.elements[i].checked = false;
                    }
                    // Work here with the Item Template's multiple checkboxes
                }
                else if (idVal.indexOf ('DeleteThis') != -1)
                {
                    // Check if any of the checkboxes are not checked, and then uncheck top select all checkbox
                    if(frm.elements[i].checked == false)
                    {
                        frm.elements[1].checked = false; //Uncheck main select all checkbox
                    }
                }
            }

        }
