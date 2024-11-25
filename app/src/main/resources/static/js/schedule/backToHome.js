document.addEventListener('DOMContentLoaded', function() {
    // 홈 링크 클릭 이벤트
    const homeLink = document.getElementById('homeLink');
    const homeModal = new bootstrap.Modal(document.getElementById('homeModal'));

    homeLink.addEventListener('click', function(e) {
        e.preventDefault();
        homeModal.show();
    });

    // 모달 확인 버튼 클릭 이벤트
    document.getElementById('confirmHomeBtn').addEventListener('click', async function() {
        try {
            // 세션 초기화 요청
            const response = await fetch('/schedule/invalidate', {
                method: 'POST'
            });

            if (response.ok) {
                // 세션 초기화 성공 시 홈으로 리다이렉트
                window.location.href = '/home';
            } else {
                console.error('세션 초기화 실패');
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            }
        } catch (error) {
            console.error('세션 초기화 요청 중 오류 발생:', error);
            alert('오류가 발생했습니다. 다시 시도해주세요.');
        }

        homeModal.hide();
    });
});
