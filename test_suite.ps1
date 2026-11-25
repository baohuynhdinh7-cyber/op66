$content = [System.IO.File]::ReadAllText("c:\website\index.html", [System.Text.Encoding]::UTF8)

function Test-Feature($name, $condition) {
    if ($condition) {
        Write-Host " [PASS] $name"
    } else {
        Write-Host " [FAIL] $name"
    }
    return $condition
}

Write-Host "=========================================================="
Write-Host "   KIEM TRA HE THONG WEBSITE LANDMARK 81 ORIENTAL PEARL   "
Write-Host "=========================================================="

$res1 = Test-Feature "1. QR transfer - VietQR chuyen khoan dong" ($content.Contains("https://img.vietqr.io/image/") -and $content.Contains("receiptQrImage"))
$res2 = Test-Feature "2. Contact - Hotline 0911 817 033 va Email" ($content.Contains("0911 817 033") -and $content.Contains("orientalpearl@vinpearllandmark81.com"))
$res3 = Test-Feature "3. Zalo chat truc tiep (zalo.me/0911817033)" ($content.Contains("zalo.me/0911817033"))
$res4 = Test-Feature "4. WhatsApp dat ban quoc te (wa.me/84911817033)" ($content.Contains("wa.me/84911817033"))
$res5 = Test-Feature "5. Facebook Messenger va Fanpage Landmark 81" ($content.Contains("m.me/VinpearlLandmark81") -and $content.Contains("facebook.com/VinpearlLandmark81"))
$res6 = Test-Feature "6. Sharing button (Facebook, Zalo, Twitter va Copy Link)" ($content.Contains("openShareModal") -and $content.Contains("shareFacebook") -and $content.Contains("shareZalo") -and $content.Contains("copyShareUrl"))
$res7 = Test-Feature "7. Admin page - Track Booking va Doanh thu" ($content.Contains("adminPortalView") -and $content.Contains("statBookings") -and $content.Contains("statRevenue") -and $content.Contains("statConversion"))
$res8 = Test-Feature "8. Admin page - Track Access va Visitors thoi gian thuc" ($content.Contains("statVisitors") -and $content.Contains("landmark81_visitors"))
$res9 = Test-Feature "9. Admin page - Dang nhap Main Admin (admin / Landmark81@2026)" ($content.Contains("Landmark81@2026") -and $content.Contains("adminLoginModal"))
$res10 = Test-Feature "10. Admin phan quyen - Main admin Tao va Xoa Sub-admins" ($content.Contains("handleCreateSubAdmin") -and $content.Contains("deleteSubAdmin") -and $content.Contains("subAdminsTableBody"))
$res11 = Test-Feature "11. Email confirmation modal gui bien nhan xac nhan cho khach" ($content.Contains("customerEmailModal") -and $content.Contains("displayCustomerEmailConfirmation") -and $content.Contains("printableEmailReceipt"))
$res12 = Test-Feature "12. Hop nhat 2 trong 1 - Guest View va Admin Portal View tren 1 file" ($content.Contains("guestView") -and $content.Contains("adminPortalView") -and $content.Contains("openAdminPortal") -and $content.Contains("closeAdminPortal"))
$res13 = Test-Feature "13. Tone sang sang trong - Trang Alabaster, Kem Ivory, Vang Hoang Gia" ($content.Contains("#FAF8F5") -and $content.Contains("#B38A38") -and $content.Contains("#1C1917"))
$res14 = Test-Feature "14. Thu vien hinh anh thuc te cao cap tu he thong nha hang" ($content.Contains("op-interior-2026.jpg") -and $content.Contains("new-landmark-pho.jpg") -and $content.Contains("buffet-line-2.jpg"))
$res15 = Test-Feature "15. AI Chatbot Co Le Tan Ao tuong tac tu van dat ban thong minh" ($content.Contains("aiChatWindow") -and $content.Contains("toggleChat") -and $content.Contains("aiChatForm"))
$res16 = Test-Feature "16. Firebase Cloud Data Sync - Firestore SDK va Cloud Panel" ($content.Contains("firebase-firestore-compat.js") -and $content.Contains("tabFirebase") -and $content.Contains("saveBookingRecord") -and $content.Contains("initFirebaseApp"))
$res17 = Test-Feature "17. Deployment Files - Vercel config, GitHub README va .gitignore" ((Test-Path "c:\website\vercel.json") -and (Test-Path "c:\website\README.md") -and (Test-Path "c:\website\.gitignore"))

$openDiv = ([regex]::Matches($content, "<div[\s>]")).Count
$closeDiv = ([regex]::Matches($content, "</div>")).Count
$openScript = ([regex]::Matches($content, "<script[\s>]")).Count
$closeScript = ([regex]::Matches($content, "</script>")).Count
$openForm = ([regex]::Matches($content, "<form[\s>]")).Count
$closeForm = ([regex]::Matches($content, "</form>")).Count

Write-Host "----------------------------------------------------------"
Write-Host "Kiem tra the HTML: Div: $openDiv / $closeDiv | Script: $openScript / $closeScript | Form: $openForm / $closeForm"

$adminFile = [System.IO.File]::ReadAllText("c:\website\admin.html", [System.Text.Encoding]::UTF8)
$adminRedir = $adminFile.Contains("index.html#admin")
Write-Host "admin.html redirect ve index.html#admin: $adminRedir"
Write-Host "=========================================================="
if ($res1 -and $res2 -and $res3 -and $res4 -and $res5 -and $res6 -and $res7 -and $res8 -and $res9 -and $res10 -and $res11 -and $res12 -and $res13 -and $res14 -and $res15 -and $res16 -and $res17 -and ($openDiv -eq $closeDiv) -and ($openScript -eq $closeScript) -and ($openForm -eq $closeForm) -and $adminRedir) {
    Write-Host "KET LUAN: 100% TAT CA 17/17 MUC CHECKLIST (BAO GOM FIREBASE, GITHUB & VERCEL) DA PASS HOAN HAO!"
} else {
    Write-Host "KET LUAN: CO MUC CHUA DAT!"
}
Write-Host "=========================================================="
