# -*- encoding:utf-8 -*-

class StrSplit(object):
    def __init__(self,  srclist):
        self.srclist = srclist
        self.sumA = [0] * len(self.srclist) # 保存从左到右依次累积统计的sum
        self.sumB = [0] * len(self.srclist) # 保存从右到左依次累积统计的sum
        self.dictA = {}                     # 保存sumA中具有某个值的索引号
                                            # 如dictA[100]为[1,12],即表示sumA[1]和sum[12]都是100
        self.dictB = {}                     # 保存sumB中具有某个相同索引号
        self.result = [0, 0, 0]             # 保存统计结果，即需要删除的三个元素的索引
        self.initstrsplit()


    def initstrsplit(self):
        sum = 0
        for i in range(0, len(self.srclist)):
            sum += self.srclist[i]
            self.sumA[i] = sum
            if self.sumA[i] in self.dictA:
                self.dictA[self.sumA[i]].append(i)
            else:
                self.dictA[self.sumA[i]] = [i]
        sum = 0
        for i in range(len(self.srclist)-1, -1, -1):
            sum += self.srclist[i]
            self.sumB[i] = sum
            if self.sumB[i] in self.dictB:
                self.dictB[self.sumB[i]].append(i)
            else:
                self.dictB[self.sumB[i]] = [i]


    def getmidpivot(self, left, right, partsum):
        if not (1 < left < right < len(self.srclist)-2 and left < right - 1):
            return False
        #print "left:%d, right:%d, partsum:%d" %(left, right, partsum)

        mid = self.sumA[left-1] + partsum # left-1为要删除的第一个元素
        if mid in self.dictA:
            for i in self.dictA[mid]: # i+1 为要删除的中间元素
                if left-1 < i < right-1:
                    #print self.sumA[right], self.sumA[i]
                    if self.sumA[right] - self.sumA[i+1] == partsum:
                        return i+1
                else:
                    continue
        return False


    def getresult(self):
        if len(self.srclist) < 7:
            return False

        for i in range(0, len(self.sumA)-4):
            if self.sumA[i] in self.dictB:
                index = self.dictB[self.sumA[i]] # index is list type
                for j in index:
                    if j > i+3:
                        # 删除元素i+1 和 j-1后, 判断是否存在中间元素
                        m = self.getmidpivot(i+2, j-2, self.sumA[i])
                        if m:
                            self.result = [i+1, m, j-1]
                            return True
        return False


    def checkresult(self):
        sum1, sum2, sum3, sum4 = 0, 0, 0, 0
        left, mid, right = tuple(self.result)

        for i in range(0, left):
            sum1 += self.srclist[i];

        for i in range(left+1, mid):
            sum2 += self.srclist[i];
        if sum2 != sum1: return False

        for i in range(mid+1, right):
            sum3 += self.srclist[i];
        if sum3 != sum1: return False

        for i in range(right+1, len(self.srclist)):
            sum4 += self.srclist[i];
        if sum4 != sum1: return False

        return True


if __name__ == "__main__":
    import random

    a = [1,2,3,4,5,6,7,8,9,10,1,2,3,24,3,4,1,3,4,5,3,2,1,2,3,4,5,6,7]
    b = [1,1,1,9,1,2,3,-3,4,1,2,5,1,2,-100,100,2,3,-5]
    c = [1,1,1,1,1,1,1]
    d = []
    e = [0,0,0,0,0,0,0,0,0,0]
    all = [a, b, c, d, e]

    for i in range(0, 100):    # 列表数
        tmp = []
        for j in range(0, random.randint(1, 1000)):     # 元素的个数
            tmp.append(random.randint(-10, 10))     # 元素的范围
        all.append(tmp)

    okcount = 0
    failcount = 0
    errorcount = 0

    for i in all:
        swf = StrSplit(i)
        # print swf.srclist
        ret = swf.getresult()
        if ret:
            okcount += 1
            if not swf.checkresult(): errorcount += 1
            print "     StrSplit: True "
            print "     Result: ", swf.result
            print "     Check result: ", swf.checkresult()
        else:
            failcount += 1

    print " SUCCESS COUNT: ", okcount
    print " FAILED COUNT: ", failcount
    print " ERROR COUNT: ", errorcount
