rule TBFC_message_trace   
{
    meta:
        author = "Andurin"
        description = "Looks for any messages McSkiddy Might have left"
        date = "2025-12-14"
        confidence = "low"

    strings:
        $tbfc_msg = /TBFC:[A-Za-z0-9]+/ ascii

    condition: 
        $tbfc_msg
}
