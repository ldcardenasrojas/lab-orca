# 1. Definición del Bucket
resource "aws_s3_bucket" "datos_secretos" {
  bucket = "mi-bucket-super-secreto"
}

# 2. Desactivar el Bloqueo de Acceso Público (¡Esta es la vulnerabilidad!)
# AWS por defecto bloquea el acceso. Creamos este recurso para DESACTIVAR
# las restricciones, lo cual es la mala práctica que Orca debe detectar.
resource "aws_s3_bucket_public_access_block" "public_access_vulnerability" {
  bucket = aws_s3_bucket.datos_secretos.id

  block_public_acls       = false # MAL: Permitimos ACLs públicas
  block_public_policy     = false # MAL: Permitimos políticas públicas
  ignore_public_acls      = false
  restrict_public_buckets = false
}