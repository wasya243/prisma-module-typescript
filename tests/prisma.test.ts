import { PrismaClient } from '../run-tests/generated/prisma';

const prisma = new PrismaClient();

beforeAll(async () => {
  await prisma.orders.deleteMany();
  await prisma.users.deleteMany();
});

afterAll(async () => {
  await prisma.$disconnect();
});

describe("Prisma models basic test", () => {
  it("should create a user and an order", async () => {
    const user = await prisma.users.create({
      data: {
        first_name: "John",
        last_name: "Doe",
      },
    });

    expect(user.id).toBeGreaterThan(0);

    const order = await prisma.orders.create({
      data: {
        user_id: user.id,
        price: 99.99,
      },
    });

    expect(order.id).toBeGreaterThan(0);

    const foundUser = await prisma.users.findUnique({
      where: { id: user.id },
      include: { orders: true },
    });

    expect(foundUser?.orders.length).toBe(1);
  });
});