#include <string.h>
#include <openssl/rsa.h>
#include <openssl/aes.h>

//	ssl使用
int main()
{
	// 1. 产生RSA密钥对
	// 产生512字节公钥指数为RSA_F4的密钥对，公钥指数有RSA_F4和RSA_3两种
	// 我不清楚它们的区别，就随便选定RSA_F4
	// 可以使用RSA_print_fp()看看RSA里面的东西
	RSA *ClientRsa = RSA_generate_key(512, RSA_F4, NULL, NULL);

	// ---------
	// 2. 从RSA结构中提取公钥到BUFF，以便将它传输给对方
	// 512位的RSA其公钥提出出来长度是74字节，而私钥提取出来有超过300字节
	// 为保险起见，建议给它们预留一个512字节的空间
	unsigned char PublicKey[512];
	unsigned char *PKey = PublicKey; // 注意这个指针不是多余，是特意要这样做的，
	int PublicKeyLen = i2d_RSAPublicKey(ClientRsa, &PKey);

	// 不能采用下面的方法，因为i2d_RSAPublicKey()会修改PublicKey的值
	// 所以要引入PKey，让它作为替死鬼
	// unsigned char *PublicKey = (unsigned char *)malloc(512);
	// int PublicKeyLen = i2d_RSAPublicKey(ClientRsa, &PublicKey);

	// 逐个字节打印PublicKey信息
	printf("PublicKeyBuff, Len=%d\n", PublicKeyLen);
	for (int i=0; i<PublicKeyLen; i++)
	{
		printf("0x%02x, ", *(PublicKey+i));
	}
	printf("\n");


	// ---------
	// 3. 跟据上面提出的公钥信息PublicKey构造一个新RSA密钥(这个密钥结构只有公钥信息)
	PKey = PublicKey;
	RSA *EncryptRsa = d2i_RSAPublicKey(NULL, (const unsigned char**)&PKey, PublicKeyLen);

	// ---------
	// 4. 使用EncryptRsa加密数据，再使用ClientRsa解密数据
	// 注意, RSA加密/解密的数据长度是有限制，例如512位的RSA就只能最多能加密解密64字节的数据
	// 如果采用RSA_NO_PADDING加密方式，512位的RSA就只能加密长度等于64的数据
	// 这个长度可以使用RSA_size()来获得
	unsigned char InBuff[64], OutBuff[64];

	strcpy((char *)InBuff, "1234567890abcdefghiklmnopqrstuvwxyz.");
	RSA_public_encrypt(64, (const unsigned char*)InBuff, OutBuff, EncryptRsa, RSA_NO_PADDING); // 加密

	memset(InBuff, 0, sizeof(InBuff));
	RSA_private_decrypt(64, (const unsigned char*)OutBuff, InBuff, ClientRsa, RSA_NO_PADDING); // 解密
	printf("RSADecrypt OK: %s \n", InBuff);


	// ----------
	// 5. 利用随机32字节Seed来产生256位的AES密钥对
	unsigned char Seed[32]; // 可以采用Rand()等方法来构造随机信息
	AES_KEY AESEncryptKey, AESDecryptKey;
	AES_set_encrypt_key(Seed, 256, &AESEncryptKey);
	AES_set_decrypt_key(Seed, 256, &AESDecryptKey);

	// ----------
	// 6. 使用AES密钥对来加密/解密数据
	// 注意，256位的AES密钥只能加密/解密16字节长的数据
	strcpy((char *)InBuff, "a1b2c3d4e5f6g7h8?");
	AES_encrypt(InBuff, OutBuff, &AESEncryptKey);

	memset(InBuff, 0, sizeof(InBuff));
	AES_decrypt(OutBuff, InBuff, &AESDecryptKey);
	printf("AESDecrypt OK: %s \n", InBuff);


	// ----------
	// 7. 谨记要释放RSA结构
	RSA_free(ClientRsa);
	RSA_free(EncryptRsa);

	return(0);
}
