const inputNama = document.getElementById("name");
const inputEmail = document.getElementById("email");
const inputJumlahTamu = document.getElementById("tamu");
const inputTglCekIn = document.getElementById("tanggal_checkin");
const inputTglCekOut = document.getElementById("tanggal_checkout");

const summaryContainer = document.getElementById("summaryContent");

let nama = document.createElement("p");
let email = document.createElement("p");
let jumlahTamu = document.createElement("p");
let tglCekIn = document.createElement("p");
let tglCekOut = document.createElement("p");

nama.innerText = inputNama.value;
email.innerText = inputEmail.value;

inputJumlahTamu.addEventListener("change", (e) => {
	jumlahTamu.innerText = `Jumlah tamu: ${inputJumlahTamu.value} Orang`;
});

inputTglCekIn.addEventListener("change", (e) => {
	tglCekIn.innerText = new Date(inputTglCekIn.value).toLocaleString("id-ID", {
		month: "short",
		day: "numeric",
		year: "numeric",
	});
});

inputTglCekOut.addEventListener("change", (e) => {
	tglCekOut.innerText = new Date(inputTglCekOut.value).toLocaleString("id-ID", {
		month: "short",
		day: "numeric",
		year: "numeric",
	});
});

summaryContainer.appendChild(nama);
summaryContainer.appendChild(email);
summaryContainer.appendChild(jumlahTamu);
summaryContainer.appendChild(tglCekIn);
summaryContainer.appendChild(tglCekOut);
