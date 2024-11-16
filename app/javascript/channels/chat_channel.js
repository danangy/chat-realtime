import consumer from "./consumer"

document.addEventListener('DOMContentLoaded', () => {
  const chatElements = document.querySelectorAll('[id^="chat_"]');
  chatElements.forEach(chatElement => {
    const chatId = chatElement.id.split('_')[1];
    consumer.subscriptions.create({ channel: "ChatChannel", chat_id: chatId }, {
      received(data) {
        const messages = document.getElementById(`chat_${chatId}`);
        messages.insertAdjacentHTML('beforeend', `<p>${data.body}</p>`);
        messages.scrollTop = messages.scrollHeight; // Scroll ke bawah otomatis
      }
    });
  });
});