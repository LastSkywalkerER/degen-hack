export interface GlobalModalService {
  error: Partial<Error & { reason?: string }> | null;
  setError: (error: Partial<Error & { reason?: string }>) => void;
  clearError: () => void;

  loading: boolean;
  setLoading: () => void;
  clearLoading: () => void;

  success: boolean;
  setSuccess: () => void;
  clearSuccess: () => void;
}
