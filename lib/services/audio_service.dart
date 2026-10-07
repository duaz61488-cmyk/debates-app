class AudioService {
  bool _isMuted = false;
  bool _isRecording = false;

  bool get isMuted => _isMuted;
  bool get isRecording => _isRecording;

  Future<void> toggleMute() async {
    _isMuted = !_isMuted;
  }

  Future<void> startAudioStream() async {
    _isRecording = true;
  }

  Future<void> stopAudioStream() async {
    _isRecording = false;
  }
}
