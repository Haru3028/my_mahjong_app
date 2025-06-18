// app/javascript/controllers/mahjong_hand_input_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["handDataJson", "tileCount", "totalTilesCount"] // hidden_fieldと枚数表示のtarget

  // 初期化時の手牌データ
  hand = {
    man: {},
    man_red: {},
    pin: {},
    pin: {},
    sou: {},
    sou_red: {},
    ji: {}
  }

  // 合計枚数を管理
  totalTiles = 0
  MAX_TILES = 14 // 最大枚数

  connect() {
    console.log("Mahjong hand input controller connected!")
    // 既存のデータがあればロードする（編集時など）
    const existingData = JSON.parse(this.handDataJsonTarget.value || "{}")
    if (Object.keys(existingData).length > 0) {
      this.hand = existingData
      this.calculateTotalTiles() // 既存データから合計枚数を計算
      this.updateDisplay() // 既存データに基づいてUIを更新
    } else {
      this.updateTotalTilesDisplay() // 初回は0/14を表示
    }
  }

  toggleTile(event) {
  const tileImage = event.currentTarget // クリックされた画像要素
  const suit = tileImage.dataset.mahjongHandInputSuit
  const value = tileImage.dataset.mahjongHandInputValue

  const currentCount = this.hand?.[suit]?.[value] || 0
  let newCount = (currentCount + 1) % 5 // 0, 1, 2, 3, 4, 0... と切り替わる

  // 14枚制限のチェック
  if (newCount > 0 && this.totalTiles >= this.MAX_TILES && currentCount === 0) {
    alert(`手牌は最大${this.MAX_TILES}枚までです。`)
    newCount = 0 // 追加をキャンセル
  }

  this.totalTiles -= currentCount

  if (newCount === 0) {
    delete this.hand?.[suit]?.[value]
  } else {
    this.hand?.[suit]?.[value] = newCount
  }

  this.totalTiles += newCount

  this.updateHandData() // hidden_fieldのJSONを更新
  this.updateDisplay() // UI（枚数表示、ボーダー）を更新
}

  // handオブジェクトの内容から合計枚数を計算
  calculateTotalTiles() {
    this.totalTiles = 0
    for (const suit in this.hand) {
      for (const value in this.hand[suit]) {
        this.totalTiles += this.hand[suit][value]
      }
    }
  }

  // handオブジェクトの内容をhidden_fieldにJSONとして書き込む
  updateHandData() {
    this.handDataJsonTarget.value = JSON.stringify(this.hand)
    console.log("Updated hand data:", this.handDataJsonTarget.value)
  }

  // UI上の牌の枚数表示とボーダー、合計枚数表示を更新
 updateDisplay() {
  this.tileCountTargets.forEach(span => {
    const tileKey = span.dataset.mahjongHandInputTileKey // 例: "man1", "ji_ton", "man_red5"
    const img = span.previousElementSibling // 牌画像要素
    const suit = img.dataset.mahjongHandInputSuit
    const value = img.dataset.mahjongHandInputValue

    const count = this.hand?.[suit]?.[value] || 0
    span.textContent = count.toString()
    img.style.border = this.getBorder(count)
  })
  this.updateTotalTilesDisplay() // 合計枚数表示も更新
}

  // 現在の合計枚数をUIに表示
  updateTotalTilesDisplay() {
    this.totalTilesCountTarget.textContent = this.totalTiles.toString()
    // 14枚に達したら色を変えるなど視覚的なフィードバックも可能
    if (this.totalTiles === this.MAX_TILES) {
      this.totalTilesCountTarget.style.color = 'green'
      this.totalTilesCountTarget.style.fontWeight = 'bold'
    } else {
      this.totalTilesCountTarget.style.color = 'black'
      this.totalTilesCountTarget.style.fontWeight = 'normal'
    }
  }

  // 枚数に応じたボーダーのスタイルを返す
  getBorder(count) {
    switch (count) {
      case 1: return '2px solid blue';
      case 2: return '2px solid green';
      case 3: return '2px solid orange';
      case 4: return '2px solid red';
      default: return '1px solid transparent'; // 0枚の場合は透明な細いボーダー
    }
  }
}