/*
 * This script updates the element 'id' with 'newContent' if the two contents differ
 */
function updateElementIfChanged(id, newContent) {
    el = $(id);
    if (el.innerHTML != newContent) { el.update(newContent); }
}

function updateTrackersStatus(paused_str, running_str, id, running)
{
    if ($$('.tracker_status_row')!='')
    {
        $$('.tracker_status_row').each( function(elem) { 
            elem.update(paused_str);
        });
        if (!running)
        {
            $$('.tracker_start').each(Element.show);
            $$('.tracker_pause').each(Element.hide);
            $('tracker_start_' + id).show();
            $('tracker_suspend_' + id).hide();
        }
        else
        {
            $('timetracker_status_' + id).update(running_str);
            $$('.tracker_start').each(Element.show);
            $$('.tracker_pause').each(Element.hide);
            $('tracker_start_' + id).hide();
            $('tracker_suspend_' + id).show();
        }
    }
}