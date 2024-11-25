// let socket = null;
// const loginUser = /*[[${session.loginUser}]]*/ {};
// console.log(loginUser);
// const messageContainer = document.getElementById('message-container');
// const messageForm = document.getElementById('message-form');
// const messageInput = document.getElementById('message-input');
//
// // 페이지 로드시 웹소켓 연결
// connectWebSocket();
//
// function toggleChat() {
//     const chatWidget = document.getElementById('chatWidget');
//     chatWidget.style.display = chatWidget.style.display === 'none' ? 'block' : 'none';
// }
//
// function connectWebSocket() {
//     socket = new WebSocket(`ws://localhost:8888/chat?roomId=room1`);
//
//     socket.onopen = function(e) {
//         appendMessage('시스템', '채팅이 연결되었습니다.');
//     };
//
//     socket.onmessage = function(event) {
//         const data = JSON.parse(event.data);
//         appendMessage(data.sender, data.message);
//     };
//
//     socket.onclose = function(event) {
//         appendMessage('시스템', '연결이 종료되었습니다.');
//     };
//
//     socket.onerror = function(error) {
//         appendMessage('시스템', '오류가 발생했습니다.');
//         console.error('WebSocket Error: ', error);
//     };
// }
//
// function sendMessage(e) {
//     e.preventDefault();
//     const message = messageInput.value.trim();
//
//     if (message && socket?.readyState === WebSocket.OPEN) {
//         const data = {
//             sender: "user1",
//             message: message
//         };
//         console.log(data);
//         socket.send(JSON.stringify(data));
//         messageInput.value = '';
//     }
// }
//
// function appendMessage(sender, message) {
//     const messageWrapper = document.createElement('div');
//     messageWrapper.className = `d-flex mb-3 ${sender === loginUser.userEmail ? 'justify-content-end' : ''}`;
//
//     const messageElement = document.createElement('div');
//
//     if (sender === '시스템') {
//         messageElement.className = 'system-message text-center w-100 text-muted fst-italic';
//     } else {
//         messageElement.className = sender === loginUser.userEmail ?
//             'bg-primary text-white rounded-3 p-3 text-break' :
//             'bg-light rounded-3 p-3 text-break';
//         messageElement.style.maxWidth = '80%';
//     }
//
//     messageElement.textContent = sender === '시스템' ? message : `${sender}: ${message}`;
//     messageWrapper.appendChild(messageElement);
//
//     messageContainer.appendChild(messageWrapper);
//     messageContainer.scrollTop = messageContainer.scrollHeight;
// }
