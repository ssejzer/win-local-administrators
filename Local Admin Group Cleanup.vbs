On Error Resume Next

Set objGroup = GetObject("WinNT://./Administrators")
objGroup.Add("WinNT://MHCorp/Domain Admins")

For Each objUser In objGroup.Members
    if objUser.Name <> "Domain Admins" And objUser.Name <> "Administrator" then
        Wscript.Echo objUser.Name
        objGroup.Remove(objUser.AdsPath)
    End if
Next

wscript.quit err.number
